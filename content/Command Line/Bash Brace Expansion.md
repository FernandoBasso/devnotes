---
tags:
  - bash
  - cmdline
  - expansion
---
## Intro

Bash brace is useful in a lot of different situations. One of them is to do surgery on text and make more shorter and elegant command lines.
## Moving (renaming) files

```bash
$ mv -v foo-{bar,tux}.txt
renamed 'foo-bar.txt' -> 'foo-tux.txt'

$ mv -v {foo-,}tux.txt
renamed 'foo-tux.txt' -> 'tux.txt'

$ mv -v {,jedi-}tux.txt
renamed 'tux.txt' -> 'jedi-tux.txt'
```

## Test globing and expansion before running a potentially dangerous command line

Consider the contents of this directory:

```bash
$ tree -F ./hello/
./hello/
├── file.txt
├── file.txt.bkp
├── hello.c
├── libmsg.c
├── libmsg.h
├── Makefile
└── Makefile.bkp
```

Our goal is to remove the `.txt` and `.bkp` files:

```bash
$ rm -v ./hello/file.txt ./hello/file.txt.bkp ./hello/Makefile.bkp
removed './hello/file.txt'
removed './hello/file.txt.bkp'
removed './hello/Makefile.bkp'
```

But that requires too much typing.
And imagine if we had hundreds or thousands of such files...

We can use _globing_ to help:

```bash
$ rm -v ./hello/*.txt ./hello/*.bkp
removed './hello/file.txt'
removed './hello/file.txt.bkp'
removed './hello/Makefile.bkp'
```

That is better.
But we can improve that command line even further.
We could use the glob _only once_, and then use _brace expansion_ to provide the multiple extensions we want to match:

```bash
$ rm -v ./hello/*.{txt,bkp}
removed './hello/file.txt'
removed './hello/file.txt.bkp'
removed './hello/Makefile.bkp'
```

That is a bit more clever and shorter.
It is also a bit riskier as we could be matching more than we mean, though 😅.
What if we accidentally remove files we don't want to remove? 😱

Of course we can use `rm -iv` so it interactively asks what to do for each file matched, but again, if there are lots of matches, it will be time consuming and boring to do it iteratively (confirm yes or no for each file).

Still, to be safe, we could test what our globing and brace expansion will do by trying with `echo` or `printf` first:

```bash
$ printf '%s\n' ./hello/*.{txt,bkp}
./hello/file.txt
./hello/file.txt.bkp
./hello/Makefile.bkp
```

OK.
It looks alright.
We feel safe moving forward and use the `rm` command on that pattern.

And so that is the tip.
We can test what our globing and expansion will do with `echo` or `printf` first _before_ using them in a more potentially dangerous command like `rm`, `shred` or others.
