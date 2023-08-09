package main

import (
    "fmt"
    "io"
    "os"
    "log"
    "net/http"
)

var instance string = "default"

func main() {
    if len(os.Args) == 2 {
        instance = os.Args[1]
    }

    log.Printf("Run HTTP server (instance: %s)\n", instance)
    http.HandleFunc("/", getRoot)
    log.Fatal(http.ListenAndServe(":80", nil))
}

func getRoot(w http.ResponseWriter, r *http.Request) {
    response := fmt.Sprintf("Got request for instance: %s\n", instance)
    fmt.Printf(response)
    io.WriteString(w, response)
}