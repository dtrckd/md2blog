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
    go mod tidy

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
    #rg before -l | xargs sed -i "s/before/after" 


## Core

What's the difference betwen json.Unmarshall and json.Decode
    -> Decode operate on stream (e.g like http). Unmarshall on bytes (i.e need to be fully loaded in memory).
       Thus unmarshall may be a bit faster.

## Formating

The fmt package in Go provides several formatting options that can be used with the fmt.Printf function to print the representation of a struct given i
ts address. Here are some commonly used formatting verbs:

1. %v: Prints the default format for the value.
2. %+v: Prints the struct fields with field names.
3. %#v: Prints the Go-syntax representation of the value.
4. %T: Prints the type of the value.
5. %t: Prints the word true or false for bool values.
6. %d: Prints the decimal representation of an integer.
7. %b: Prints the binary representation of an integer.
8. %x or %X: Prints the hexadecimal representation of an integer.
9. %f: Prints the floating-point representation of a number.
10. %s: Prints the string representation of a value.
11. %p: Prints the address of a pointer.

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

Use reflect to assert that two object (of unknwon type) are equal (deep equal)

    // Instanciate an empty empty object of the same type than input.Set
    t := reflect.TypeOf(input.Set).Elem()
    a := reflect.New(t).Elem().Interface()
    b := *input.Set
    b.Nodes = nil
    // Ignore if the update it is just appending the data to new node (not actually modifing it)
    if !reflect.DeepEqual(a, b) {
        // Check if the node updated as the lowest depth in the nodes list.
        return nil, LogErr("Access denied", fmt.Errorf("This object belongs to more than one node, edition is locked. Edition is only possible at the root circle level."))
    }
