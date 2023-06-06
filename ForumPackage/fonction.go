package ForumPackage

import (
	"database/sql"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func AfficherCategories() []string {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT nom FROM categorie")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var categories []string
	for rows.Next() {
		var nomCategorie string
		if err := rows.Scan(&nomCategorie); err != nil {
			log.Fatal(err)
		}
		categories = append(categories, nomCategorie)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return categories
}

func AfficherTopics() []string {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT nom FROM topic")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var topics []string
	for rows.Next() {
		var nomTopic string
		if err := rows.Scan(&nomTopic); err != nil {
			log.Fatal(err)
		}
		topics = append(topics, nomTopic)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return topics
}
