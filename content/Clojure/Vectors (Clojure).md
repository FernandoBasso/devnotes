---
tags:
  - clojure
  - vector
  - dsa
description: Notes and examples on Clojure vectors.
---
## Create a Vector
#vector #collection #data-structure

```clojure
;;;;
;; Create empty vector.
;;
(def v1 (vector))
v1
;=> []

;;;;
;; Or with the literal [] syntax.
;;
(def v2 [])
v2
;=> []

;;;;
;; Create a non-empty vector.
;;
(def v3 (vector 10 20 30))
v3
;=> [10 20 30]

;;;;
;; Non-empty vector with the literal [] syntax.
;;
(def v4 [10 20 30])
v4
;=> [10 20 30]
```

## Append to a Vector
#vector #conj #append

Appending to a vector is $O(1)$.

To append to a vector we use `conj` (conjoin). The basic syntax is `conj`, followed by the vector we want to append items to, followed by one or more elements.

```clojure
;;;;
;; Add 1 2 3 to an empty vector.
;;
(conj (vector) 1 2 3)
;=> [1 2 3]

;;;;
;; Add 1 2 3 to an empty vector with literal vector syntax.
;;
(conj [] 1 2 3)
;=> [1 2 3]

;;;;
;; Add a few more elements to vector
(conj [1 2 3] 4 5 6)
[1 2 3 4 5 6]
```

## Prepend to a Vector
#vector #prepend #apply #into

Inserting at beginning of a vector is $O(n)$ time complexity.

With `apply vector`. Note unlike `conj`, first the new value to prepend, then the existing vector.

```clojure
(apply vector 5 [1 3])
;=> [5 1 3]
```

Or with `into`. Note the value 5 is made a vector. So first the new value `[5]` (as a vector itself) to be prepended, then the existing vector:

```clojure
(into [5] v)
;=> [5 1 3]
```


- https://stackoverflow.com/questions/4095714/what-is-the-idiomatic-way-to-prepend-to-a-vector-in-clojure
