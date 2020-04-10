(use -v for verbose output)

Install (don't add in go.mod if in a module)

    GO111MODULE=off go get github.com/usr/repo

List installed package

    go list ...

List dependencies package

    go list -m [all|package]

other uses

     go list -f '{{join .Imports "\n"}}' [path|...]
     or
     go list -f '{{.ImportPath}} {{join .Imports "\n"}}' [path|...]

Update a packate

    go get -u <package_name>

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

