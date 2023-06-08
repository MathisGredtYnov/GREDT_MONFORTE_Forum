package ForumPackage

import (
	"database/sql"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

type Topic struct {
	Nom          string
	Contenu      string
	Created_date string
	Pseudonyme   string
}

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

func AfficherTopics() []Topic {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT nom, contenu, created_date, pseudonyme FROM topic, message, utilisateur WHERE topic.ID_topic = message.ID_topic AND message.ID_user = utilisateur.ID_user GROUP BY topic.ID_topic ORDER BY topic.ID_topic ASC")
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
