---
tags:
  - clojure
  - list
  - data-structure
  - dsa
---
## Create lists
#list #quote

To create a list, enclose the values in parenthesis and quote the list with `(quote)` or  `'` as in Lisp or Scheme:

```clojure
(def xs '(10 20 30))
(def names (quote ("Aayla" "Ahsoka" "Leia")))
```

Or using the `list` function (and no quoting):

```clojure
(def xs (list 10 20 30))
(def names (list ("Aayla" "Ahsoka" "Leia")))
```

No matter the syntax used to create the list, they are the same:

```clojure
(= (list 10 20 30) '(10 20 30))
;=> true
```

Note that when the list is printed in the REPL, the “quoting” is not present in the output:

```clojure
xs
;=> (10 20 30)

names
;=> ("Aayla" "Ahsoka" "Leia")
```

Observe there is no `'` in front of the opening parenthesis in the REPL's output.
## Access list elements
#list #nth

```clojure
(nth xs 0)
;=> 10

(nth xs 2)
;=> 30

(nth names 0)
;=> "Aayla"

(nth names 2)
;=> "Leia"
```

Retrieving a value from a vector is $O(1)$ time complexity, but using retrieving a value from a list is potentially $O(n)$ time complexity, because the list has to be walked up to the desired element.

## Index out of bounds error
#list #nth #index #error

Unlike some other data structures that return `nil` if the index or key cannot be found, trying to access a list element which is out of bounds produces an error:

```clojure
(nth xs 3)
;~ Unhandled java.lang.IndexOutOfBoundsException
```

## Add an element to a list
#list #prepend #conj

Use `conj` to add an element to a list. `conj` appends to a vector, but _prepends_ to a list. The time complexity of `conj` on lists is $O(1)$, just as when used with vectors.

```clojure
(def nums '(20 30 40))
(conj nums 10)
;=> (10 20 30 40)
```
