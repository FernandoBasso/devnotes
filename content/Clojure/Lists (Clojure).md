---
tags:
  - clojure
  - list
  - data-structure
  - dsa
---
## Intro

To create a list, enclose the values in parenthesis and quote the list with `(quote)` or  `'` as in Lisp or Scheme:

```clojure
(def xs '(10 20 30))

(nth xs 0)
;=> 10

(nth xs 2)
;=> 30

(def names (quote ("Aayla" "Ahsoka" "Leia")))

(nth names 0)
;=> "Aayla"

(nth names 2)
;=> "Leia"
```

Retrieving a value from a vector is $O(1)$ time complexity, but using retrieving a value from a list is potentially $O(n)$ time complexity, because the list has to be walked up to the desired element.

But unlike some other data structures that return `nil` if the index or key cannot be found, trying to access a list element which is out of bounds produces an error:

```clojure
(nth xs 3)
;~ Unhandled java.lang.IndexOutOfBoundsException
```

Note that when the list is printed in the REPL, the “quoting” is not printed:

```clojure
xs
;=> (10 20 30)

names
;=> ("Aayla" "Ahsoka" "Leia")
```

No `'` in front of the opening parenthesis in the outpt.