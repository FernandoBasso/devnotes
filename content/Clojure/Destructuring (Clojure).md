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

It is possible to destructure from a vector or a list. Maps too, which a slightly different syntax.
## Destructuring function parameters

Destructuring is specially useful when dealing with function parameters. Let's see how it works by implementing the function `car`.

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

## Destructuring function parameters with rest

It is also possible to bind certain values to names, and collect the remaining arguments in the rest parameter:

```clojure
(defn cdr
  "Returns the collection without including the first element."
  [[_ & rest]]
  rest)

(cdr '(a b c d e f))
;=> (b c d e f)

(cdr '(May The Force Be With You))
;=> (The Force Be With You)
```

We used the underscore `_` to bind the first value, but as we don't intend to use it for this example, we don't give it a meaningful name (this is a common pattern in some languages, including Haskell).

## Destructuring a map
#destructuring #map

```clojure
(defn treasure-location
  "Returns the treasure location with latitute and longitude."
  [{lat :lat lng :lng}]
  (format "Latitude: %.2f, Longitude: %.2f." lat lng))

(treasure-location {:id "0xff" :lat 21.13 :lng 77.91})
;=> "Latitude: 21.13, Longitude: 77.91."
```

In this example lat maps to :lat and lng maps to :lng, which look like they are the same name. But the name we bind does not have to be the same as the map key.

```clojure
(defn loc
  "Returns the location."
  [{lat :latitude lng :longitude}]
  (format
   "Go to latitude %.2f and longitude %.2f to find the treasure."
   lat
   lng))

(loc {:latitude 21.23 :longitude 77.91})
;=> "Go to latitude 21.23 and longitude 77.91 to find the treasure."
```

The map passes :latitude and :longitude, but we bind them to lat and lng, which are not the “same names”.

## Destructuring a map with :keys short syntax
#destructuring #keys #map

Using the `:keys` shorter syntax for breaking keywords out of a map when performing destructuring.

```clojure
(defn loc
  "Returns a string announcing the treasure location."
  [{:keys [lat lng]}]
  (format
   "The treasure is located at latitude %.2f, longitude %.2f."
   lat
   lng))

(loc {:id "0xff" :lat 21.47 :lng 88.79})
;=> "The treasure is located at latitude 21.47, longitude 88.79."
```
