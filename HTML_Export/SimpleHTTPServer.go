package main

import (
	"time"
	"fmt"
	"flag"
	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
	"log"
	"net/http"
	//"strings"
)

var port = ":8080"
var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func SendIndex(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "index.html")
	t := time.Now()
	fmt.Print(t.Format("15:04:05"))
	fmt.Println(" index.html")
}

func SendFiles(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	http.ServeFile(w, r, vars["file"])
	t := time.Now()
	fmt.Print(t.Format("15:04:05"))
	fmt.Println(" "+vars["file"])
}

func main() {
	flag.Parse()
	log.SetFlags(0)
	fmt.Println("Starting HTTP Server at 127.0.0.1:8080")
	net := mux.NewRouter()
	net.HandleFunc("/", SendIndex)
	net.HandleFunc("/{file}", SendFiles)
	_ = http.ListenAndServe(port, net)
}