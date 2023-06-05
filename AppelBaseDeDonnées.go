package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func appelbasedonnée() {
	db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/projet_forum")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT ID_user, pseudonyme FROM utilisateur WHERE ID_user = 1")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var id int
		var name string
		if err := rows.Scan(&id, &name); err != nil {
			log.Fatal(err)
		}
		fmt.Println(id, name)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
}
