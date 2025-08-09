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
- `(and)` returns `true`.

These ideas are similar to the concept of _identity_. Consider that the identity of addition is 0, as $x + 0 = x$, which is why `(+)` (no operands) returns 0, and the identity of multiplication as 1, as $x \times 1 = x$, which is why `(*)` (again, no operands) returns 1. We can say that when no operands are given to `or` and `and`, they return their identity value.

`or` short-circuits and returns at the first non-falsey value. `and`, by definition, _has_ to evaluate all of its expressions.
