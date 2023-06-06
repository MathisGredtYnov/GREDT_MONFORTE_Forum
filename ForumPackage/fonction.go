package ForumPackage

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func AfficherCategories() string {
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

	categories := ""
	for rows.Next() {
		var nomCategorie string
		if err := rows.Scan(&nomCategorie); err != nil {
			log.Fatal(err)
		}
		categories += fmt.Sprintf("%s", nomCategorie)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return categories
}
