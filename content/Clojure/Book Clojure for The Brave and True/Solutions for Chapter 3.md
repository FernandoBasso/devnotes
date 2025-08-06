---
tags:
  - clojure
  - book
  - exercises
description: Solutions for the exercises of chapter 3 of the book Clojure for The Brave and True.
---
## Exercise 1

### str

```clojure
(str "one as " 1)
;=> "one as 1"
```

### vector
```clojure
(vector)
;=> []
```

### list

Note we _prepend_ 3 to the list.

```clojure
(conj '(1 2) 3)
;=> (3 1 2)
```

### hash-map

```clojure
(def yoda { :id 1, :name "Yoda" :skill "The Force"})
(str (:name yoda) "'s skill is " (:skill yoda) ".")
;=> "Yoda's skill is The Force."
```

### hash-set

```clojure
(def uniq (hash-set 1 1 :nodups :nodups))
uniq
;=> #{1 :nodups}
```


## 2 Add 100

```clojure
(defn add100
  "Add 100 to the number given."
  [x]
  (+ x 100))

(add100 0)
;=> 100

(add100 -100)
;=> 0;

(add100 1)
;=> 101
```


## 3 dec maker

```clojure
(defn dec-maker
  "Returns a function that decrements the given number by n."
  [n]
  (fn [x] (- x n)))

(def dec1 (dec-maker 1))
(dec1 10)
;=> 9

(def dec25 (dec-maker 25))
(dec25 100)
;=> 75
```

## mapset

```clojure
(defn mapset
  "Maps f over the values xs and and dedups values."
  [f xs]
  (loop [res #{} ys xs]
    (if (empty? ys)
      res
      (recur
       (conj res (f (first ys)))
       (rest ys)))))

(mapset inc [1 1 1])
;;=> #{2}

(mapset dec [20 20 10 10])
;;=> #{19 9}

(mapset #(- % 5) [105 5 105 5])
;;=> #{0 100}
```

When we `conj` a value that already exists in a hash-set, Clojure doesn't actually add it and therefore no duplicates remain.
