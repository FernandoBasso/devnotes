---
tags:
  - fibonacci
  - sequence
  - math
  - dsa
description: Example implementation of generating the Fibonacci sequence using a few different languages and programming paradigms.
---

## Intro

- https://www.mathsisfun.com/numbers/fibonacci-sequence.html

## Clojure

### v1

```clojure
(defn fibr
  "Fibonacci using a traditional recursive implementation."
  [n]
  (case n
    0 0
    1 1
    (+ (fibr (- n 1)) (fibr (- n 2)))))
```

An input like 99 (or maybe less) takes forever complete, or never completes depending on the system under which it is run.
### v2

```clojure
(defn fibi
  "Fibonacci using iteration for better performance."
  ([n] (fibi 0N 1N n))
  ([cur nxt n]
   (cond
     (zero? n) cur
     :else (recur nxt (+ cur nxt) (dec n)))))
```

Runs almost instantaneously with inputs like 111111 or 99999. Still very computationally expensive with values higher than those.
