
Install a CLI tool without touching go.mod

    go install github.com/jstemmer/gotags@latest

    # GOPATH mode (GO111MODULE=off go get) was removed in Go 1.22

Pin a CLI tool *in* go.mod (Go 1.24+), then run it

    go get -tool github.com/jstemmer/gotags
    go tool gotags

List installed binaries

    ls $(go env GOBIN) $(go env GOPATH)/bin

List packages of the current module

    go list ./...

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

## Updating: module dependency vs installed binary

`go get` only edits the go.mod of the module you stand in (since Go 1.16 it installs nothing).
An installed CLI has no go.mod, so `go get tool@latest` outside a module just errors with
"go.mod file not found ... 'go get' is no longer supported outside a module".
Update a binary the same way you installed it: `go install`.

Update a dependency of the current module

    go get -u <package_name>
    go get github.com/someone/some_module@af044c0995fe   # at a given commit/tag

Update all dependencies of the current module

    go get -u
    go mod tidy

    # test deps included
    go get -u -t all

Update a globally installed binary (re-run the install, it overwrites)

    go install github.com/tomasz-tomczyk/crit/cmd/crit@latest

Update every installed binary (no builtin for it; read the origin back from the binary)

    # fish
    for b in (go env GOPATH)/bin/*
        go version -m $b | awk '/\tpath\t/{print $2"@latest"; exit}'
    end | xargs -n1 go install

Remove dependancie unuse

    go mod tidy

Change the go version of a module 

    go mod edit -go=1.14
    #or simply edit go.mod manually...

Install a given tag

    go install github.com/nsqio/nsq/apps/nsqd@v1.1.0


Used forked repo or rename a module

    go mod edit -replace="github.com/someone/repo@v0.0.0=github.com/you/repo@v1.1.1"

    # if busy, just do
    #rg before -l | xargs sed -i "s/before/after/"


## Core

What's the difference betwen json.Unmarshal and json.NewDecoder(r).Decode
    -> Decode operates on a stream (e.g like http), and can read several values in a row.
       Unmarshal on bytes (i.e need to be fully loaded in memory), thus a bit faster.

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
