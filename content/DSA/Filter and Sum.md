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

## Using the thread last operator

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
