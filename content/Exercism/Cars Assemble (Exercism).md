---
tags:
  - exercism
  - conditional
---
## Clojure

- https://exercism.org/tracks/clojure/exercises/cars-assemble

Notes:

- The tests require that the return values of `production-rate` are floats.
- In Clojure, a double is a kind of float. 

### v1

```clojure
(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate."
  [speed]
  (let [total (* 221.0 speed)]
    (cond
      (<= speed 4) (double total)
      (and (>= speed 5) (<= speed 8)) (double (* 0.9 total))
      (= speed 9) (double (* 0.8 total))
      :else (* 0.77 (double total)))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
```

This is the first “whatever works” implementation. Note we had to convert the return values to `double` explicitly in the `production-rate` function.


### v2

```clojure
(defn success-rate
  "success-rate :: Long -> Double

   Returns the success rate based on the speed."
  [speed]
  (cond
    (<= speed 4) 1.0
    (<= speed 8) 0.9
    (<= speed 9) 0.8
    :else 0.77))

(defn production-rate
  "success-rate :: Long -> Double

   Returns the assembly line's production rate per hour, taking into
   account its success rate."
  [speed]
  (let [total (* 221.0 speed)]
    (* (success-rate speed) total)))

(defn working-items
  "working-items :: Long -> Integer

   Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
```

In this solution, we have a helper `success-rate` function that returns a literal double.

`production-rate` multiplies `(success-rate speed)` with `total`.  That means we are multiplying a long and an integer, and Clojure (like some other programming languages) converts to the “larger” type, therefore, `(* (success-rate speed) total)` results in a double, which satisfies the tests.

That is, `(* somInteger someDouble)` yields a `Double`, not an `Integer`.

```text
$ clj
Clojure 1.12.1

user=> (type 1)
java.lang.Long

user=> (type 1.1)
java.lang.Double

user=> (type (* 1 1.1))
java.lang.Double

user=> (float? (* 1 1.1))
true
```

### Other Interesting Solutions

- https://exercism.org/tracks/clojure/exercises/cars-assemble/solutions/amirci

