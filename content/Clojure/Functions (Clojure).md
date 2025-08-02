---
tags:
  - clojure
  - function
  - lisp
  - functional-programming
description: Notes and examples on Clojure functions.
---
## Intro to functions in Clojure

Function application is the process of applying a function to one or more values. In non-FP world, people say “call” or “invoke” a function.


## Conditionally choose function to apply

### or example

```clojure
((or nil -) 1 2 3)
;=> -4
```

`(or nil -)` returns `-`, which is applied to `1 2 3`.

```clojure
((or nil - ) 1 2 3)
(- 1 2 3)
-4
```

### and example

```clojure
((and (= 1 (- 2 1)) +) 10 20)
;=> 30
```

The equality is true, so it evals the next expression `+`, which is a function, which is then applied to `10 20`.

```clojure
((and (= 1 (- 2 1)) +) 10 20)
((and (= 1 1) +) 10 20)
((and true +) 10 20)
(+ 10 20)
30
```

### Be careful

The resulting expression has to evaluate to a function, otherwise, there will be a disturbance in the force:

```clojure
((or nil false 1) 10 20)
;~ Execution error (ClassCastException) at user/eval138 (REPL:1).
;~ class java.lang.Long cannot be cast to class clojure.lang.IFn
```

This is how it evaluates:

```clojure
((or nil false 1) 10 20)
(1 10 20)
```

`(or nil false 1) returns 1, and 1 is not a function.
