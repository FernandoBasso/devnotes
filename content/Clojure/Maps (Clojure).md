---
tags:
  - clojure
  - map
  - dsa
description: Notes and examples on Clojure maps.
---
## Intro

Maps are like dictionaries or hash tables in other languages. It is a way to associate one value with another. We can consider that one value is the key, and the other value is associated with the key.

Clojure features two kinds of hash maps: normal and sorted. Unless otherwise noted, consider the next examples are normal (non-sorted) maps.

- https://clojure.org/reference/data_structures#Maps

## Basic Examples

Create an empty map using both the `hash-map` function and the literal syntax.

```clojure
(def m2 (hash-map))
(def m1 {})
```

Or a non-empty map that points some keyword keys to numbers:

```clojure
(def items (hash-map :a 1 :b 2))

;; or

(def items {:a 1 :b 2})
```

Access the values by looking up keys using the `get` function:

```clojure
(get items :a)
;=> 1

(get items :b)
;=> 

(+ (get items :a) (get items :b))
;=> 3
```

Or by using the map itself as a function and then using the key as argument:

```clojure
(items :a)
;=> 1

(items :b)
;=> 2

(+ (items :a) (items :b))
;=> 3
```
