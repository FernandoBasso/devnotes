---
tags:
  - cmdline
  - column
---
## Intro

The unix `column` command line utility columnates lists and csv-style data.

Note that the `column` utility is not part of the [POSIX specification](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
Among other things, it means different systems will support a different feature set.
And as always, GNU command line utilities offer a larger (and arguably better) set of features.
## Initial example

For example, if the columns are separated with spaces (and tabs are also considered spaces by default):

```bash
cat <<EOF | column -t
ID NAME EDITOR
1 Bram vim
2 Richard emacs
3 Vader ed
EOF
ID  NAME     EDITOR
1   Bram     vim
2   Richard  emacs
3   Vader    ed
```

Or, if the fields are separated with some other character, like “,” (comma), then we use `-s,` to make `column` use “,” as the separator:

```bash
$ cat <<EOF | column -ts,
ID,NAME,EDITOR
1,Bram,vim
2,Richard,emacs
3,Vader,ed
EOF
ID  NAME     EDITOR
1   Bram     vim
2   Richard  emacs
3   Vader    ed
```

And if the data is on a file, we can do something like this:

```bash
$ column -ts, -- ./heroes.csv 
ID  NAME     EDITOR
1   Bram     vim
2   Richard  emacs
3   Vader    ed
```
