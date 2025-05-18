package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from Service B")
	})

	fmt.Println("Server is listening on port 5001...")
	http.ListenAndServe(":5001", nil)
}
