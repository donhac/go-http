package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "%s\n", "a")
}
func main() {
	// http.Handle("/", http.FileServer(http.Dir("/Users/donh/work/gayhub/web-app")))
	http.HandleFunc("/hello", handler)
	http.ListenAndServe(":8080", nil)
}
