package main

import (
	"fmt"
	"forum/ForumPackage"
	"html/template"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	fmt.Println("server is running on port 8080 http://localhost:8080")
	//gestion du FRONTEND
	http.Handle("/FRONTEND/", http.StripPrefix("/FRONTEND/", http.FileServer(http.Dir("FRONTEND"))))
	//gestion des pages
	http.HandleFunc("/", Index)
	http.HandleFunc("/Private", Private)
	http.HandleFunc("/Compte", Compte)
	http.HandleFunc("/CGU", CGU)
	http.ListenAndServe(":8080", nil)
}

func Index(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}

	if r.Method == "POST" {
		handleRegistration(w, r)
		return
	}

	data := buildIndexData()
	renderIndexTemplate(w, data)
}

func handleRegistration(w http.ResponseWriter, r *http.Request) {
	username := r.FormValue("username")
	email := r.FormValue("email")
	password := r.FormValue("password")

	err := ForumPackage.InsertUserData(username, email, password)
	if err != nil {
		log.Fatal(err)
	}

	if ForumPackage.AuthenticateUser(email, password) {
		// L'authentification réussit, redirigez vers la page d'accueil ou une autre page appropriée
		http.Redirect(w, r, "/", http.StatusSeeOther)
		return
	}

	// L'authentification a échoué, affichez un message d'erreur approprié
	fmt.Fprintf(w, "Identifiants invalides")
}

func buildIndexData() interface{} {
	data := struct {
		Categories []struct {
			ID     int
			Nom    string
			Topics []ForumPackage.Topic
		}
		Topics []ForumPackage.Topic
	}{
		Categories: make([]struct {
			ID     int
			Nom    string
			Topics []ForumPackage.Topic
		}, 0),
		Topics: ForumPackage.AfficherTopics(),
	}

	categoriesFromDB := ForumPackage.AfficherCategories()

	for _, categorieDB := range categoriesFromDB {
		cat := struct {
			ID     int
			Nom    string
			Topics []ForumPackage.Topic
		}{
			ID:     categorieDB.ID,
			Nom:    categorieDB.Nom,
			Topics: ForumPackage.AfficherTopicsForCategorie(categorieDB.ID),
		}
		data.Categories = append(data.Categories, cat)
	}
	return data
}

func renderIndexTemplate(w http.ResponseWriter, data interface{}) {
	tmp := template.Must(template.ParseFiles("FRONTEND/template/index.html"))
	tmp.Execute(w, data)
}

func Private(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/Private" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	tmp := template.Must(template.ParseFiles("FRONTEND/template/Private.html"))
	tmp.Execute(w, nil)
}

func Compte(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/Compte" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	tmp := template.Must(template.ParseFiles("FRONTEND/template/Compte.html"))
	tmp.Execute(w, nil)
}

func CGU(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/CGU" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	tmp := template.Must(template.ParseFiles("FRONTEND/template/CGU.html"))
	tmp.Execute(w, nil)
}

func errorHandler(w http.ResponseWriter, r *http.Request, status int) {
	w.WriteHeader(status)
	if status == http.StatusNotFound {
		fmt.Fprint(w, "404 not found")
	}
}
