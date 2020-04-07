
install (don't add in go.mod if in a module)

    GO111MODULE=off go get github.com/usr/repo

installed package

    go list ...

update a packate

    go get -u <package_name>

with imported package

     go list -f "{{.ImportPath}} {{.Imports}}" ...

used forked repo or rename a module

    go mod edit -replace="github.com/someone/repo@v0.0.0=github.com/you/repo@v1.1.1"

    # if buffy, just do
    #rg before --files-with-matches |xargs sed -i "s/before/after" 

