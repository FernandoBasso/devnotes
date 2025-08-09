---
tags:
  - clojure
  - function
  - anonymous
  - lambda
---
## Two ways to create anonymous functions

Clojure provides two kinds of syntax to create anonymous functions:

- Using the `fn` macro.
- Using the `#(f %)` short syntax.

Let's create a function that increments by 2 as examples (Clojure already provided `inc` and `dec` that increments and decrements by 1):

```clojure
(map (fn [x] (+ x 2))
     [0 51 99])
;=> (2 53 101)

(map #(+ % 2)
     [0 51 99])
;=> (2 53 101)
```

In the first case with `fn`, each element in the vector `[0 51 99]` is bound to `x` in turn. In the example with `#(f %)` (possible due to _reader macros_), `%` is bound to each element of the vector each time.

We can bind anonymous functions created with `fn` to a name and use it like any other function:

```clojure
(def inc-by-2 (fn [x] (+ x 2)))
(map inc-by-2 (range 50 90 10))
;=> (52 62 72 82)
```

Another example:

```clojure
(defn say-hi
  [& names]
  (map #(format "Hi, %s.%n" %) names))

(say-hi "Yoda" "Leia" "Luke")
;=> ("Hi, Yoda.\n" "Hi, Leia.\n" "Hi, Luke.\n")
```

## Anonymous functions with #(%1 %2 ...)

If the anonymous function takes more than one single argument, multiple arguments can be denoted with `%1`, `%2`, etc.

```clojure
(#(str %1 " and " %2) "oil" "water")
;=> "oil and water"

(#(str %1 ", ", %2 " and " %3) "x" "y" "z")
;=> "x, y and z"
```

## Anonymous functions with #(rest params)
#lambda #rest #parameter #argument

Rest parameters can be collected with `%&`:

```clojure
(#(apply + %&) 1 2 3)
6
```
