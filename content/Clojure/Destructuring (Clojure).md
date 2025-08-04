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

It is possible to destructure from a vector or a list.
## Destructuring function parameters

Destructuring is specially useful when dealing with function parameters. Let's see how it works by implementing the function `car` (note that Clojure already provides `first`. Haskell provides `head`).

```clojure
(defn car
  "Returns the first element of a vector or list."
  [[x]]
  x)

(car '(May The Force Be With You))
;=> May

(car (range 6 9))
;=> 6
```

Remember that Clojure uses `[]` to denote a parameter list. Then, we use another pair of `[]` with one or more sequential parameters we want to bind to names. In our example, we bound the first value of the passed collection to `x`. We then simply return that value (which is what `car` does in Lisp and Scheme).

