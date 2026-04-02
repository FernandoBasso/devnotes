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