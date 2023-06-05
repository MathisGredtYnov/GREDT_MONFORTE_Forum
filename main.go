package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func main() {
	fmt.Println("server is running on port 8080 http://localhost:8080")
	//gestion des css
	http.Handle("/CSS/", http.StripPrefix("/CSS/", http.FileServer(http.Dir("FRONTEND/CSS"))))
	//gestion des assets
	http.Handle("/ASSETS/", http.StripPrefix("/ASSETS/", http.FileServer(http.Dir("ASSETS"))))
	//gestion des images
	http.Handle("/ASSETS/image", http.StripPrefix("/ASSETS/IMG", http.FileServer(http.Dir("img"))))
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
	tmp := template.Must(template.ParseFiles("FRONTEND/template/index.html"))
	tmp.Execute(w, nil)
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

func CGU2(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/CGU2" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	tmp := template.Must(template.ParseFiles("FRONTEND/template/CGU2.html"))
	tmp.Execute(w, nil)
}

func errorHandler(w http.ResponseWriter, r *http.Request, status int) {
	w.WriteHeader(status)
	if status == http.StatusNotFound {
		fmt.Fprint(w, "404 not found")
	}
}
