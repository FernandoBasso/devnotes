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

```



What improvements can be made to this implementation without switching
to loop & recur? The goal is to make sure the code is idiomatic
Clojure, and performance should be kept in mind as well.
### 1. Prefer Destructuring Over `first`/`rest`
Using sequence destructuring is more idiomatic than calling `first` and `rest` repeatedly:

```clojure
(letfn [(go [[x & xs] max-so-far]
          (if (nil? x)
            max-so-far
            (go xs (if (> x max-so-far) x max-so-far))))]
  (go xs Double/NEGATIVE_INFINITY))
```

---

### 2. Avoid Using `Double/NEGATIVE_INFINITY` with Integers

If your numbers are all integers, returning `Double/NEGATIVE_INFINITY` might be surprising. Instead, you could use `nil` for empty collections and initialize with the first value (after checking for emptiness):

```clojure
(defn maximum [xs]
  (cond
    (empty? xs) nil
    :else
    (letfn [(go [[x & xs] max-so-far]
              (if (nil? x)
                max-so-far
                (go xs (if (> x max-so-far) x max-so-far))))]
      (go (rest xs) (first xs)))))
```

---

### 3. Use `apply max` for Simplicity

Clojure’s standard library already provides a fast (and idiomatic) way to find a maximum:
```clojure
(defn maximum [xs]
  (when (seq xs)
    (apply max xs)))
```
This is both highly idiomatic and efficient.

---

### 4. Performance Note

- Your recursive implementation is already optimal (tail recursion) for what it does.
- For very large collections, the standard library versions (`max`, `reduce`) are highly optimized in Clojure.

---

## Summary

- **Most idiomatic:** use Clojure’s built-in `max` and `apply`, returning nil if empty.
- **If you want to stick with recursion:** use destructuring, initialize with `first`, and avoid special IEEE values when possible.