package main

import (
	"fmt"
	"forum/ForumPackage"
	"html/template"
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

	type Cat struct {
		ID     int
		Nom    string
		Topics []ForumPackage.Topic
	}

	data := struct {
		Categories []Cat
		Topics     []ForumPackage.Topic
	}{
		Categories: make([]Cat, 0),
		Topics:     ForumPackage.AfficherTopics(),
	}

	categoriesFromDB := ForumPackage.AfficherCategories()

	for _, categorieDB := range categoriesFromDB {
		topics := ForumPackage.AfficherTopicsForCategorie(categorieDB.ID)

		cat := Cat{
			ID:     categorieDB.ID,
			Nom:    categorieDB.Nom,
			Topics: topics,
		}
		data.Categories = append(data.Categories, cat)
	}

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
