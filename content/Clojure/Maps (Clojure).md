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

## Keys and values of maps

Keywords, strings, symbols and numbers can be used as map keys. The values can be any type available in the language (other data structure types, functions, etc.). Here are just some examples.

```clojure
(def m {1 "one" "two" 2 :three 'three 'four :four})

(m 1)
;=> "one"
; The key 1 maps to the string "one".

(m "two")
;=> 2
; The key "two" maks to the number 2.

(m :three)
;=> three
; The key :three maps to the symbol 'three (which prints
; as simply three, not 'three).

(m 'four)
;=> :four
; The symbol 'four maps to the keyword :four.
```

A map pointing some keywords to functions:

```clojure
(def ops {:add + :sub -})

((ops :add) 1 2)
;=> 3

((get ops :sub) 5 3)
;=> 2
```

Explanation: `(ops :add)` returns `+`, so the expression becomes `(+ 1 2)`, which results in 3. A similar process happens with the example involving the subtraction.

## Basic Examples with Keywords

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

## Nil when keyword doesn't exist

When attempting to retrieve the value for a keyword that does not exist in the map, is it an error? Does it throw some sort of exception? Nope, it simply returns `nil`:

```clojure
(def m {:x 1})

(m :x)
;=> 1

(m :y)
;=> nil

(get m :x)
;=> 1

(get m :y)
;=> nil
```

## Nested Maps (Jedi Example)

```clojure
(def jedi
  {:name
   {
    :first "Aayla"
    :last "Secura"
    }
   :skill "Lightsaber"
   :power 100})
```

Retrieving the values of some keywords. Note that `:name` is a nested map:

```clojure
(jedi :name)
;=> {:first "Aayla", :last "Secura"}

(jedi :skill)
;=> "Lightsaber"

(jedi :power)
;=> 100
```
