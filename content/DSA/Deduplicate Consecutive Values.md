---
tags:
  - dsa
  - collection
description: Some notes, tips and examples on implementing a function that deduplicate consecutive equal values in a collection.
---
## Intro

Write a function to deduplicate consecutive identical elements from a given collection.

Example:

```text
dedup([1 1 1 2 2 3 3 3 1 1]);
//=> [1 2 3 1]
```

Note that 1 shows up again at the end because it appeared after 3, so, the second time the 1's shows up, it was not “consecutive“ to the first time.

## Clojure

### v1, vanilla recursion

```clojure
(defn dedup
  "De-duplicates consecutive identical elements."
  [xs]
  (letfn [(go [remaining-xs deduped-xs last-seen-x]
            (if (empty? remaining-xs)
              deduped-xs
              (go (rest remaining-xs)
                  (if (= (first remaining-xs) last-seen-x)
                    deduped-xs
                    (conj deduped-xs (first remaining-xs)))
                  (first remaining-xs))))]
    (go xs [] nil)))

(dedup [])
;;=> []

(dedup [1 1 1 1 1])
;;=> [1]

(dedup [1 2 3 4 5])
;;=> [1 2 3 4 5]

(dedup [1 1 2 2 2 3 3 4])
;;=> [1 2 3 4]

(dedup [1 1 1 2 2 3 3 3 1 1 1])
;;=> [1 2 3 1]
```

### v2, loop & recur

```clojure
(defn dedup
  "De-duplicates consecutive identical elements."
  [xs]
  (loop [remaining-xs xs
         deduped-xs []
         last-seen-x nil]
    (if (empty? remaining-xs)
      deduped-xs
      (recur (rest remaining-xs)
             (if (= (first remaining-xs) last-seen-x)
               deduped-xs
               (conj deduped-xs (first remaining-xs)))
             (first remaining-xs)))))
```

Note that the parameters and the whole logic is the same as with the vanilla recursion.