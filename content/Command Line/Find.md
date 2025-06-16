---
tags:
  - cmdline
  - find
  - gnu
---
## Find files and store in array

Find files whose extension is `.md` and store them in a bash array:

```bash
$ mapfile -d $'\0' mds < <(find . -iname '*.md' -print0)
```

We make use of the `mapfile` shell builtin with the shell-quoting `$''` syntax to specify NUL byte as delimiter (produced by `-print0`), redirection and process substitution `<(...)`.
