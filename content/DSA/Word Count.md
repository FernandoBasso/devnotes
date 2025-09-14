---
tags:
  - dsa
  - count
  - string
  - recursion
description: Some notes, tips and examples on implementing a word count program using loops and recursion.
---
## Clojure

### Solution 1 (code duplication)

```clojure
(defn word-count
  "Counts words in a string. Returns a map with each word as a key
   and their count as the value."
  [s]
  (let [words (split s #" ")]
    (loop [ws words
           acc {}]
      (if (empty? ws)
        acc
        (if (nil? (get acc (first ws)))
          (recur (rest ws)
                 (assoc acc (first ws) 1))
          (recur (rest ws)
                 (update acc (first ws) inc)))))))

(word-count "aa bb cc aa bb aa")
;;=> {"aa" 3, "bb" 2, "cc" 1}
```


The `(if (nil? ...))` check is to know if the words is already present as a key in the acculumator map. If it is _not_, add the word as a key and initialize its value to 0. If it _is_ already present, then increment its count instead.

Note that we write `recur`, `(rest ws)` and `(first ws)` a few times. There are ways to improve this.

### Solution 2 (a little less code duplication)

```clojure
(defn word-count
  "Counts words in a string. Returns a map with each word as a key
   and their count as the value."
  [s]
  (let [words (split s #" ")]
    (loop [ws words
           acc {}]
      (if (empty? ws)
        acc
        (recur (rest ws)
               (if (nil? (get acc (first ws)))
                 (assoc acc (first ws) 1)
                 (update acc (first ws) inc)))))))

(word-count "aa bb cc aa bb aa")
;;=> {"aa" 3, "bb" 2, "cc" 1}
```

This time we use `recur` only once and move the condition to check if the word is already in the accumulator to a place inside the `recur` expression. We still need to make the decision if we should use `assoc` or `update` and initialize to 1 or increment the value. Note we still have the `(first ws)` call three times. We could use `let` and do it only once:

```clojure
(defn word-count
  "Counts words in a string. Returns a map with each word as a key
   and their count as the value."
  [s]
  (let [words (split s #" ")]
    (loop [ws words
           acc {}]
      (if (empty? ws)
        acc
        (recur (rest ws)
               (let [fw (first ws)]
                 (if (nil? (get acc fw))
                   (assoc acc fw 1)
                   (update acc fw inc))))))))
```

A little better!