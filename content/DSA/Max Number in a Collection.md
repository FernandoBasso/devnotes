---
tags:
  - dsa
  - max
  - collection
description: Notes, tips and examples on finding the maximum number in a collection of numbers.
---
## Problem statement


## Clojure

Given a collection of numbers, return the largest one. If the collection starts empty, return some representation of negative infinity $-\infty$.

## v1, recursive call

**Time complexity**: $O(n)$, as the collection is traversed once.

**Space complexity**: $O(1)$ as we don't use any new space besides the `max-so-far` numeric parameter.

```clojure
(defn max
  "Return the largest nubmer in the given collection."
  ([xs]
   (max xs Double/NEGATIVE_INFINITY))
  ([xs max-so-far]
   (if (empty? xs)
     max-so-far
     (let [x (first xs)
           remaining (rest xs)]
       (if (> x max-so-far)
         (max remaining x)
         (max remaining max-so-far))))))

(max [])
;;=> ##-Inf

(max [-5 -1])
;;=> -1

(max [-5 -1 9 42])
;;=> 42

(max [-5 1 9 42 -42])
;;=> 42
```
