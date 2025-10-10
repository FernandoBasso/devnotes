---
tags:
  - dsa
  - eval
---

## Intro

- https://en.wikipedia.org/wiki/Reverse_Polish_notation

```clojure
(eval-rpn [2 1 '+])
;;=> 3

(eval-rpn [17 3 '-])
;;=> -14

(eval-rpn [5 1 2 '+ 4 '* '+ 3 '-])
;;=> -14
```


## Clojure

```clojure
(defn ^:private get-op
  [f]
  (get {'+ (fn [x y] (+ x y))
        '* (fn [x y] (* x y))
        '- (fn [x y] (prn {:x x :y y}) (- x y))
        '/ (fn [x y] (/ x y))} f))

(defn eval-rpn
    [expr]
    (let [stack []]
      (peek
       (reduce (fn [stk token]
                 (if (number? token)
                   (conj stk token)
                   (let [x (peek stk)
                         stk1 (pop stk)
                         y (peek stk1)
                         stk2 (pop stk1)]
                     (prn {:x x :y y :token token :sym '-})
                     (conj stk2 ((get-op token) x y)))))
               stack
               expr))))
```
