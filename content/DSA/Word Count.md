---
tags:
  - dsa
  - count
  - string
  - recursion
description: Some notes, tips and examples on implementing a word count program using loops and recursion.
---
## Intro

Create a function `word-count` that takes a string and returns a map of each unique word to its frequency. Here, assume a word is any number of characters separated by a whitespace.

Assume the input contains only lowercase characters and is not empty.

Examples:

```clojure
(word-count "aa")
;;=> {"aa" 1}

(word-count "aa aa aa")
;;=> {"aa" 3}

(word-count "aa bb cc aa bb aa")
;;=> {"aa" 3, "bb" 2, "cc" 1}
```

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

### Solution 3 (no duplication)

For this one we'll use `fnil`:

> `fnil` takes a function `f`, and returns a function that calls `f`, replacing a `nil` first argument to `f` with the supplied value `x`.

We can understand it as ""

 Let's see how it works with some examples:
 
```clojure
(def f (fnil inc 10))

(f nil)
;;=> 11

(f 0)
;;=> 1
```

Bind `f` to the a function (that uses `fnil`) to apply `inc` to the parameter. If the parameter is `nil`, apply `inc` to 10, otherwise, apply `inc` to the given parameter.

Therefore, `(f nil)` applies `inc` to 10 (which results in 11), because the parameter was `nil`, but `(f 0)` applies `inc` to 0 (which results in 1).

Let's apply this idea to `word-count`:

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
               (update acc (first ws) (fnil inc 0)))))))

(word-count "aa bb cc aa bb aa")
;;=> {"aa" 3, "bb" 2, "cc" 1}
```

Interestingly, we don't need the `if` condition inside `recur` any longer. We go straight to always doing an `update` (and don't have the `assoc` case any longer). It works because `(fnil inc 0)` will initialize the value for the given word to 1 if it was not already present in the accumulator, or it will update whatever numeric value was already there.

Hurray for higher order functions!