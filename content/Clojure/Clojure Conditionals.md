---
tags:
  - clojure
  - or
  - and
  - conditional
  - if
  - when
description: Notes and examples on conditionals in Clojure.
---
## or, and

![Clojure 1.12.1 and or docs 02-08-2025](clojure-1.12.1-and-or-docs-02-08-2025.png.png) 

- `(or)` returns `nil`.
- `(and)` returns `false`.

`or` short-circuits and returns at the first non-falsey value. `and`, by definition, _has_ to evaluate all its exprs.