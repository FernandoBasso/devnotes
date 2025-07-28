---
tags:
  - exercism
  - dsa
description: Armstrong Number Exercism Lisp exercise notes and solutions.
---

## Clojure

### v1

```clojure
(defn to-digits
  "to-digits :: Num -> Vector<Num>

   Turns an integer like 123 into a vector of the digits [1 2 3]."
  [n vod]

  (if (< n 10)
    (apply vector n vod)
    (recur
     (quot n 10)
     (apply vector (mod n 10) vod))))

(defn armstrong?
  "armstrong? :: Long -> Bool

   Returns a boolean indicating whether the given number
   is an Armstrong number."
  [num]
  (let [digits (to-digits num [])]
    (->> digits
         (map #(.pow (bigdec %) (count digits)))
         (reduce +)
         (== num))))
```

### v2

```clojure
(defn to-digits
  "to-digits :: Num -> Vector<Num>

   Turns an integer like 123 into a vector of the digits [1 2 3]."
  [num]
  (loop [n num vod []]
    (if (< n 10)
      (apply vector n vod)
      (recur
       (quot n 10)
       (apply vector (mod n 10) vod)))))

(defn armstrong?
  "armstrong? :: Num -> Bool

   Returns a boolean indicating whether the given number
   is an Armstrong number."
  [num]
  (let [digits (to-digits num)]
    (->> digits
         (map #(.pow (bigdec %) (count digits)))
         (reduce +)
         (== num))))
```
