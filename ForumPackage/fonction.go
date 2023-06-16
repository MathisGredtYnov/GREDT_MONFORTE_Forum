package ForumPackage

import (
	"crypto/sha256"
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

type Topic struct {
	ID           int
	Nom          string
	Contenu      string
	Created_date string
	Pseudonyme   string
}

type Categorie struct {
	ID  int
	Nom string
}

func AfficherCategories() []Categorie {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT ID_categorie, nom FROM categorie")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var categories []Categorie
	for rows.Next() {
		var categorie Categorie
		if err := rows.Scan(&categorie.ID, &categorie.Nom); err != nil {
			log.Fatal(err)
		}
		categories = append(categories, categorie)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return categories
}

func AfficherTopics() []Topic {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT topic.ID_topic, topic.nom, message.contenu, message.created_date, utilisateur.pseudonyme FROM topic, message, utilisateur WHERE topic.ID_topic = message.ID_topic AND message.ID_user = utilisateur.ID_user GROUP BY topic.ID_topic ORDER BY topic.ID_topic ASC")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var topics []Topic
	for rows.Next() {
		var topic Topic
		if err := rows.Scan(&topic.ID, &topic.Nom, &topic.Contenu, &topic.Created_date, &topic.Pseudonyme); err != nil {
			log.Fatal(err)
		}
		topics = append(topics, topic)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return topics
}

func AfficherTopicsForCategorie(categorieID int) []Topic {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT nom, contenu, created_date, pseudonyme FROM topic, message, utilisateur WHERE topic.ID_topic = message.ID_topic AND message.ID_user = utilisateur.ID_user AND topic.ID_categorie = ? GROUP BY topic.ID_topic ORDER BY topic.ID_topic ASC", categorieID)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var topics []Topic
	for rows.Next() {
		var topic Topic
		if err := rows.Scan(&topic.Nom, &topic.Contenu, &topic.Created_date, &topic.Pseudonyme); err != nil {
			log.Fatal(err)
		}
		topics = append(topics, topic)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return topics
}

func InsertUserData(username string, email string, password string) error {
	// Connexion à la base de données MySQL et insertion des données
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		return err
	}
	defer db.Close()

	hashedPassword := hashPassword(password)
	_, err = db.Exec("INSERT INTO utilisateur (ID_user, pseudonyme, Email, Mot_de_passe) VALUES (NULL, ?, ?, ?)", username, email, hashedPassword)
	if err != nil {
		return err
	}

	return nil
}

func Login(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		email := r.FormValue("loginEmail")
		password := r.FormValue("loginPassword")

		// Vérifier les informations d'identification
		if AuthenticateUser(email, password) {
			http.Redirect(w, r, "/compte", http.StatusSeeOther)
			return
		} else {
			fmt.Fprintf(w, "Identifiants invalides")
			return
		}
	}
}

func AuthenticateUser(email string, password string) bool {
	// Vérifier les informations d'identification dans la base de données
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Effectuer une requête pour récupérer les informations d'identification de l'utilisateur
	var storedPasswordHash string
	err = db.QueryRow("SELECT Mot_de_passe FROM utilisateur WHERE Email = ?", email).Scan(&storedPasswordHash)
	if err != nil {
		log.Fatal(err)
	}

	// Hasher le mot de passe saisi
	hashedPassword := hashPassword(password)

	// Comparer le mot de passe haché avec le mot de passe stocké
	if hashedPassword == storedPasswordHash {
		return true
	}
	return false
}

func hashPassword(password string) string {
	// Hasher le mot de passe avec sha256
	hash := sha256.Sum256([]byte(password))
	return fmt.Sprintf("%x", hash)
}
