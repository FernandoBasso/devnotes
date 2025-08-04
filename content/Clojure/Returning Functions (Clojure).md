---
tags:
  - clojure
  - function
  - closure
  - return
  - higher-order-function
description: Returning functions in Clojure.
---
## Intro

Higher order functions can take functions as parameter, but also _return_ functions. When they return functions, they are _closures_, meaning the returned function has access to bindings that were in scope when the original function was created.

The classic example involves a function that returns a function that increments a number by $n$.

```clojure
(defn make-inc-by
 "Returns a function that increments a number by n."
 [by]
 #(+ % by))

(def inc-by-10 (make-inc-by 10))
(inc-by-10 11)
;=> 21

(def dec-by-10 (make-inc-by -10))
(dec-by-10 11)
;=> 1
```

Yeah, the `dec-by-10` example decrements by 10 because the maker function was passed `-10` as an argument. Math is awesome!
