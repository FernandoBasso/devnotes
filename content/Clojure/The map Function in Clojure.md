---
tags:
  - clojure
  - map
  - function
  - collection
---
## Intro

The `map` function works over _sequence abstractions_ (see [Clojure Sequences](Clojure%20Sequences.md)). We can use `map` with lists, vectors, hash-sets and hash-maps (that is, we don't need specific implementations like `maplist`, `mapvector`, etc. for different built-in collection types).

## Basic examples

Initially, we can think of using `map` to apply _one_ function to a collection of values, generating a new, modified collection of values.

Map `inc` over a collection.

```clojure
;; List
(map inc '(1 2 3))
;;=> (2 3 4)

;; Vector
(map inc [1 2 3])
;;=> (2 3 4)

;; HashSet
(map inc #{1 2 3})
;;=> (2 4 3)

;; HashMap
(map #(inc (second %)) {:a 1 :b 2 :c 3})
;;=> (2 3 4)
;;
;; Remember that seq turns the map:
;;
;;   {:a 1 :b 2 :c 3}
;;
;; into:
;;
;;   ([:a 1] [:b 2] [:c 3])
;;;;
```

If the function we pass to `map` takes two params, then we can pass two collections. `str` takes zero or more params, meaning it also takes two params, or three params:

```clojure
(map str ["Aayla" "Ahsoka" "Leia"] ["Secura" "Tano" "Organa"])
;;=> ("AaylaSecura" "AhsokaTano" "LeiaOrgana")

(map
 str
 ["Aayla" "Ahsoka" "Leia"]
 (repeat 3 " ")
 ["Secura" "Tano" "Organa"])
;;=> ("Aayla Secura" "Ahsoka Tano" "Leia Organa")
```

Or an example that creates [URL slugs](https://en.wikipedia.org/wiki/Clean_URL) of the first names and last names:

```clojure
(def first-names ["Aayla" "Ahsoka" "Leia"])
(def last-names ["Secura" "Tano" "Organa"])

(defn slugify
  "Returns a url-friendly slug with a combination of a user's
   first and last name.

   ASSUME: both vectors have the same number of elements."
  [first-names last-names]
  (map
   str
   (map #(.toLowerCase %) first-names)
   (repeat (count first-names) "-")
   (map #(.toLowerCase %) last-names)))

(slugify [] [])
;;=> ()

(slugify (take 2 first-names) (take 2 last-names))
;;=> ("aayla-secura" "ahsoka-tano")

(slugify first-names last-names)
;;=> ("aayla-secura" "ahsoka-tano" "leia-organa")
```

## map multiple functions over a single value

Besides mapping a *single* function over *multiple* values, we can also map _multiple_ functions over a _single_ value.

TODO
### Map multiple functions over multiple values

```clojure
(def sum #(reduce + %))

(def avg #(/ (sum %) (count %)))

(defn stats
  "Returns a collection with the count of the elements, their
   sum, and the average."
  [vals]
  (map #(% vals) [count sum avg]))

(def xs [1 2 3 4])

(count xs)
;;=> 4

(sum xs)
;;=> 10

(avg xs)
;;=> 5/2

(stats xs)
;;=> (4 10 5/2)
;;
;; Four elements, their sum is 10, and the average is 0.5.
;;;;
```
