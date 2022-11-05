(use -v for verbose output)

Install (don't add in go.mod if in a module)

    GO111MODULE=off go get github.com/usr/repo

List installed package

    go list ...

List dependencies package

    go list -m [all|package]

Equivalent to `npm-outdated`

    go list -mod=readonly -u -m -f '{{if not .Indirect}}{{if .Update}}{{.}}{{end}}{{end}}' all

List all dependencies that have updates (including indirect depencies)

    go list -mod=readonly -u -m -f '{{if .Update}}{{.}}{{end}}' all

other uses

     go list -f '{{join .Imports "\n"}}' [path|...]
     # or
     go list -f '{{.ImportPath}} {{join .Imports "\n"}}' [path|...]

Update a package at a given commit

    go get github.com/someone/some_module@af044c0995fe

Update a package

    go get -u <package_name>

Update all package

    # Current Module
    go get -u

    # Global
    go get -u all

Remove dependancie unuse

    go mod tidy

Change the go version of a module 

    go mod edit -go=1.14
    #or simply edit go.mod manually...

Install a given tag (only possible with mod in v1.11)

    mkdir temp
    cd temp
    go mod init .
    go get -d -v github.com/nsqio/nsq@v1.1.0
    mkdir bin
    go build -o bin/nsqd.exe github.com/nsqio/nsq/apps/ns


Used forked repo or rename a module

    go mod edit -replace="github.com/someone/repo@v0.0.0=github.com/you/repo@v1.1.1"

    # if buffy, just do
    #rg before --files-with-matches |xargs sed -i "s/before/after" 


## Core

What's the difference betwen json.Unmarshall and json.Decode
    -> Decode operate on stream (e.g like http). Unmarshall on bytes (i.e need to be fully loaded in memory).
       Thus unmarshall may be a bit faster.

## Using reflect

Creating a new struct from an interface:

https://stackoverflow.com/questions/7850140/how-do-you-create-a-new-instance-of-a-struct-from-its-type-at-run-time-in-go

```
package main

import (
    "fmt"
    "reflect"
)

func main() {

    type Product struct {
        Name  string
        Price string
    }

    var product Product
    productType := reflect.TypeOf(product)       // this type of this variable is reflect.Type
    productPointer := reflect.New(productType)   // this type of this variable is reflect.Value. 
    productValue := productPointer.Elem()        // this type of this variable is reflect.Value.
    productInterface := productValue.Interface() // this type of this variable is interface{}
    product2 := productInterface.(Product)       // this type of this variable is product

    product2.Name = "Toothbrush"
    product2.Price = "2.50"

    fmt.Println(product2.Name)
    fmt.Println(product2.Price)

}
```
