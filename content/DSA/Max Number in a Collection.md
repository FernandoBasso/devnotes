---
tags:
  - dsa
  - max
  - collection
description: Notes, tips and examples on finding the maximum number in a collection of numbers.
---
[]()## Problem statement

## Clojure

Given a collection of numbers, return the largest one. If the collection starts empty, return some representation of negative infinity $-\infty$.

### v1, recursive call, multiple signatures

**Time complexity**: $O(n)$, as the collection is traversed once.

**Space complexity**: $O(1)$ as we don't use any new space besides the `max-so-far` numeric parameter.

```clojure
(defn maximum
  "Return the largest nubmer in the given collection."
  ([xs]
   (max xs Double/NEGATIVE_INFINITY))
  ([xs max-so-far]
   (if (empty? xs)
     max-so-far
     (let [x (first xs)
           remaining (rest xs)]
       (if (> x max-so-far)
         (maximum remaining x)
         (maximum remaining max-so-far))))))

(maximum [])
;;=> ##-Inf

(maximum [-5 -1])
;;=> -1

(maximum [-5 -1 9 42])
;;=> 42

(maximum [-5 1 9 42 -42])
;;=> 42
```

### v2, letfn

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

### v3, destructuring instead of first & rest

```clojure
(defn maximum
      "Return the maximum value in the given numeric
       collection; nil if the collection is empty."
      [xs]
      (if (empty? xs)
        nil
        (letfn [(go [[x & xs] max-so-far]
                    (if (nil? x)
                      max-so-far
                      (if (> x max-so-far)
                        (go xs x)
                        (go xs max-so-far))))]
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

With this approach, instead of using `first` and `rest`, we use destructuring to handle the first element, and the rest of the elements. Haskell has something like this as well:

```haskell
go (x:xs) maxSoFar = ...
```

Where `x` is the first element, and `xs` is the rest of the collection. Very similar to Clojure's. 
```
go [x & xs] max-so-far ...
```

### v4, loop, recur

In Clojure, `loop` & `recur` are generally more performant than vanilla recursion due to the way Clojure is implemented through the JVM.

```clojure
(defn maximum
   "Return the maximum value in the given numeric
   collection; nil if the collection is empty."
  [xs]
  (if (empty? xs)
    nil
    (loop [max-so-far Double/NEGATIVE_INFINITY
           [x & remaining] xs]
      (if (nil? x)
        max-so-far
        (if (> x max-so-far)
          (recur x remaining)
          (recur max-so-far remaining))))))

(maximum [])
;;=> ##-Inf

(maximum [-5 -1])
;;=> -1

(maximum [-5 -1 9 42])
;;=> 42

(maximum [-5 1 9 42 -42])
;;=> 42
```

Note the base case inside the `loop`. It checks if `(nil? x)`. It could also be if `(empty? remaining)` as well.
## Haskell

## v1

```haskell
mymax :: [Integer] -> Integer
mymax [] = error "Empty list has no maximum number"
mymax (x:xs) = go x xs
  where
    go :: Integer -> [Integer] -> Integer
    go maxSoFar [] = maxSoFar
    go maxSoFar (curr:rest) =
      if curr > maxSoFar
      then go curr rest
      else go maxSoFar rest
```

