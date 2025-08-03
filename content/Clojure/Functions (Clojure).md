---
tags:
  - clojure
  - function
  - lisp
  - functional-programming
description: Notes and examples on Clojure functions.
---
## Intro to functions in Clojure

In Clojure and Lisps in general, function applications are expressions that have a function expression as the operator. Here, `+` is a function expression, and it is used as the operator.

```clojure
(+ 1 2)
```

And here, we have an anonymous function, also used as (in the position of) the operator:

```clojure
                      (#(- % 1) 5)
;;                     --------
;;                         |
;;                         |
;;                         v
;;      The #(- % 1) is the function expression used
;;      as (in the position of) the operator.
;; 
```

The expression `#(- % 1)` is a function. Imagine we represent it with `f`, then, we could write like `(f 5)`. In this case, this function does the same as `(dec 5)`. To illustrate more concretely:

```clojure
user> (def f #(- % 1))
user> (f 5)
4
```

Function application is the process of applying a function to one or more values. In non-FP world, people say “call” or “invoke” a function.

Function expressions always evaluate its operands recursively. There are also _macros_ and _special forms_ that don't always evaluate all of their operands, and and they cannot be passed as arguments to functions. For example, `if` is a special form. But it will evaluate only one of its branches:

```clojure
 (if (= 1 1) "Yes" "No")
"Yes"
```

Now imagine if `if` would evaluate both the "Yes" and "No" expressions. It would not be useful, right?

Marcos and special forms that implement core functionality within the language itself, and cannot be implemented purely with functions, so yep, they are special stuff. A small number of special forms are enough to make the language very rich and expressive nonetheless.
## Prefix notation

Lisps (and therefore Clojure) use the so called _prefix notation_ for function application (instead of _infix notation_. That is, instead of writhing something like `(1 + 2)` (infix notation), we instead write `(+ 1 2)` (prefix notation). It allows one to provide many operands and still write the prefix function expression only once. Compare:

```
// C, or JavaScript, or Java, or most non FP languages.
1 + 2 + 3 + 4

vs

;; Lisp & Scheme
(+ 1 2 3 4)
```

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

`(or nil false 1)` returns 1, and 1 is not a function.
