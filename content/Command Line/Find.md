---
tags:
  - cmdline
  - find
  - gnu
---
## Find filename finds nothing

There as a file called  `config.yml` somewhere in the project. Try to find it:

```text
$ find . config.yml
(lots of filename outputs)
find: ‘config.yml’: No such file or directory

$ find . -type f config.yml
find: paths must precede expression: `config.yml'
```

Those errors are because neither of those `find` commands are correct or valid to find a file by its name. For that, we should use `-name pattern`:

```text
$ find . -name config.yml
./functions/config.yml
```

Pattern can include globs, but make sure to quote it. `find` handles the glob and we should prevent the shell from expanding the glob before it is handed to `find`:

```text
$ find . -name '*config*'
./.git/gk/config
./.git/config
./functions/config.json.example
./functions/config.yml
./functions/config.prod.json.example
./functions/config.prod.json
./functions/tsconfig.json
./functions/config.json
```


## Find files and store in array

Find files whose extension is `.md` and store them in a bash array:

```bash
$ mapfile -d $'\0' mds < <(find . -iname '*.md' -print0)
```

We make use of the `mapfile` shell builtin with the shell-quoting `$''` syntax to specify NUL byte as delimiter (produced by `-print0`), redirection and process substitution `<(...)`.
