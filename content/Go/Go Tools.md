---
tags:
  - go
  - tools
  - lint
description: Notes and examples on how to install and use some of the most useful Go tools.
---
## gopls (language server)

```text
$ go install golang.org/x/tools/gopls@latest
$ gopls -help
```

When updating go with `asdf`, and you get a problem similar to this (and lsp doesn't work in nvim, vscode, etc.):

```
$ go version
go version go1.26.4 linux/amd64

$ go install golang.org/x/tools/gopls@latest

$ gopls -help
No version is set for command gopls
Consider adding one of the following versions in your config file at /home/devy/source/adocwiki/.tool-versions
golang 1.26.1

$ cat .tool-versions
golang 1.26.4
```

The solution is to “reshim”:

```text
$ asdf reshim golang
```

Then run the  `go install ...` again, and it should work.

## lint

https://golangci-lint.run/docs/welcome/install/local/

Binary will be `$(go env GOPATH)/bin/golangci-lint`:

```text
$ curl -sSfL https://golangci-lint.run/install.sh | \
    sh -s -- -b $(go env GOBIN) v2.11.4
```

Or install it into `./bin/`
```
$ curl -sSfL https://golangci-lint.run/install.sh | \
    sh -s v2.11.4

golangci-lint --version
```

Then:

```
$ golangci-lint --version
```