---
tags:
  - clojure
  - recursion
  - loop
  - recur
description: Notes and examples about recursion in Clojure.
---
## Recursive call of a function
#recursion #function

```clojure
(defn countdown
  "Prints from ini down to 1 then Go!, each on its line."
  [n]
  (println n)
  (if (= n 0)
    (println "Go!")
    (countdown (dec n))))

(countdown 3)
;; 3
;; 2
;; 1
;; Go!
;;;;
```

Due to Java and JVM internals (upon which Clojure is built), this form of recursion, even with the recursion in the tail call, is less performant than using `loop` and `recur`.

## Recur using loop and recur
#loop #recur

One way to recur in Clojure is by using `loop` and `recur`:

```clojure
(loop [c 3]
  (println c)
  (if (= c 0)
    (println "Go!")
    (recur (dec c))))
;; 3
;; 2
;; 1
;; Go!
;;;;
```

Or use it inside a function:

```clojure
(defn countdown
  "Prints from ini down to 1 then Go!, each on its line."
  [ini]
  (loop [c ini]
    (println c)
    (if (= c 0)
      (println "Go!")
      (recur (dec c)))))

(countdown 5)
;; 5
;; 4
;; 3
;; 2
;; 1
;; Go!
;;;;
```
