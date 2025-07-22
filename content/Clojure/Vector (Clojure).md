---
tags:
  - clojure
  - vector
  - dsa
---
## Create a Vector

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

```clojure
;;;;
;; Add 1 2 3 to an empty vector.
;;
(conj (vector) 1 2 3)
;=> [1 2 3]

(conj [] 1 2 3)
;=> [1 2 3]

;;;;
;; Add a few more elements to vector
(conj [1 2 3] 4 5 6)
[1 2 3 4 5 6]
```

## Prepend to a Vector

```clojure
(apply vector 5 [1 3])
;=> [5 1 3]
```
