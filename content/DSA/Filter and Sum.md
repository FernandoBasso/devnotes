---
tags:
  - filter
  - sum
  - dsa
description: The classic "filter and sum" coding examples which is commonly used to display functional programming style.
---
## Clojure

### Nested functions

```clojure
(defn filter-sum
  "Filters numbers that match the predicate f and returns their sum."
  [f xs]
  (apply + (filter f xs)))

(filter-sum even? [1 2 3 4])
;;=> 6

(filter-sum odd? [1 2 3 4])
;;=> 4
```

### Using the thread last operator

```clojure
(defn filter-sum
  "Filters numbers that match the predicate f and returns their sum."
  [f xs]
  (->> xs
       (filter f)
       (apply +)))

(filter-sum even? [1 2 3 4])
;;=> 6

(filter-sum odd? [1 2 3 4])
;;=> 4
```

### Using function composition

```clojure
(defn filter-sum
  "Filters numbers that match the predicate f and returns their sum."
  [f xs]
  ((comp (partial apply +)
         (partial filter f)) xs))

(filter-sum even? [1 2 3 4 5])
;;=> 6

(filter-sum odd? [1 2 3 4 5])
;;=> 4

(filter-sum #(<= % 2) [1 2 3 4 5])
;;=> 3
```

Remember that `comp` evaluates from right-to-left.