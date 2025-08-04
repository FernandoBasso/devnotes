---
tags:
  - clojure
  - destructuring
  - function
description: Notes and examples on destructuring in Clojure.
---
## Intro

Destructuring allows one to concisely bind values from a collection to names. Consider that instead of this more verbose approach:

```clojure
(def xs [10 20 30])

(def a (get xs 0))
(def b (get xs 1))
(def c (get xs 2))

(+ a b c)
;=> 60
```

We could assign to `a`, `b` and `c` as concisely as this:

```clojure
(let [[a b c] xs]
  (+ a b c))
60
```


