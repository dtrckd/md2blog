
installed package

    go list ...

with imported package

     go list -f "{{.ImportPath}} {{.Imports}}" ...

used forked repo or rename a module

    go mod edit -replace="github.com/someone/repo@v0.0.0=github.com/you/repo@v1.1.1"
