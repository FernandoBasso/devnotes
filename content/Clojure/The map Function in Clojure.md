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

## Combine the values of two vectors

Given two numeric collections of the same length, for each corresponding pair of elements, return a hash-map with each x and y keys and their values, and the sum of each x and y pair.

```clojure
(def xs [1 2 3 4])
(def ys [10 20 30 40])

(defn combine
  "Returns a map with x, y and their sum."
  [x y]
  {:x x
   :y y
   :sum (+ x y)})

(defn report
  "Returns a collection of maps of all xs, ys and their sums."
  [xs ys]
  (map combine xs ys))

(report xs ys)
;;=> ({:x 1, :y 10, :sum 11}
;;=>  {:x 2, :y 20, :sum 22}
;;=>  {:x 3, :y 30, :sum 33}
;;=>  {:x 4, :y 40, :sum 44})
```

Note that `combine` takes two arguments, and we do pass two collections when we do `(map combine xs ys)`.

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

Note we passed `stats` a vector `xs` containing four elements. Inside `stats`, however, we map `#(% vals)` giving the anonymous function a vector with three (function) elements: `[count sum avg]`. That is why the resulting array contains three elements, instead of four. Let's give `stats` input of some other lengths:

```clojure
(stats [5 4 1 9 5 8 3 9])
;;=> (8 44 11/2)
;;
;; 8 elements, their sum is 44, and their average is 11/2.
;;;;

(stats [7])
;;=> (1 7 7)
;;
;; 1 element, sum to 7, and the average is 7.
;;;;
```

So as we see, the collection length output is the same as that of the number of functions passed to `map`.
