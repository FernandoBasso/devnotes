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

## v1, recursive call, multiple signatures

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

## v2, letfn

```clojure
(defn maximum
      "Return the maximum value in the given numeric collection. Returns nil
       if the collection is empty."
      [xs]
      (if (empty? xs) nil
        (letfn [(go [remaining max-so-far]
                    (if (empty? remaining)
                        max-so-far
                      (if (> (first remaining) max-so-far)
                          (go (rest remaining) (first remaining))
                        (go (rest remaining) max-so-far))))]
               (go xs Double/NEGATIVE_INFINITY))))

(maximum [])
;;=> ##-Inf

(maximum [-5 -1])
;;=> -1

(maximum [-5 -1 9 42])
;;=> 42

(maximum [-5 1 9 42 -42])
;;=> 42
```

With this approach, instead of having multiple signatures to handle the negative infinity, instead create an internal `go` function that calls itself recursively. Its initial invocation passes the original `xs` number collection *and* `Double/NEGATIVE_INFINITY` for the initial `max-so-far` value.
