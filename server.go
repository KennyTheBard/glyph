package main

import (
	"database/sql"
	"fmt"

	st "glyph/story"
	u "glyph/user"

	"github.com/gin-gonic/gin"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 54321
	user     = "postgres"
	password = "password"
	dbname   = "glyphdb"
)

func main() {

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	defer db.Close()

	r := gin.New()
	r.Use(gin.Logger())
	r.Use(gin.Recovery())

	api := r.Group("/api")
	{
		u.Endpoint(db, api.Group("/user"))
		st.Endpoint(db, api.Group("/story"))
	}

	r.Run(":8080")
}
