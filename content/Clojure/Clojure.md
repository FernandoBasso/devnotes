---
tags:
  - clojure
  - programming-language
  - text-editor
description: My notes, tips and ideas on the Closure programming language.
---
## Intro

- https://clojure.org/guides/install_clojure
- https://leiningen.org/
- https://wiki.archlinux.org/title/Clojure
- https://guide.clojure.style/
- https://londonclojurians.org/code-dojo/
- https://github.com/ldnclj

See [Install Tools With ASDF](Install%20Tools%20With%20ASDF.md).


## Static Analyzer & Linters

- https://cljdoc.org/d/clj-kondo/

### cljfmt

- https://github.com/weavejester/cljfmt

Add to something like this to `project.clj`:

```
:plugins [[dev.weavejester/lein-cljfmt "0.13.1"]]
```

Then run this from the command line shell:

```bash
$ lein cljfmt check
```

It will install the necessary stuff and check the files. Replace `check` with `fix` to fix the files in place instead of just checking for formatting problems.

## Videos

[Expert to Expert: Rich Hickey and Brian Beckman - Inside Clojure](https://www.youtube.com/watch?v=wASCH_gPnDw)
