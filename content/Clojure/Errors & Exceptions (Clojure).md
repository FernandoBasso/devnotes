---
tags:
  - clojure
  - error
description: Notes and examples about errors and exceptions in Clojure.
---
## Cannot invoke "Object.getClass()" because "x" is null
#error #null

```clojure
(def m {:x 1})
(+ (m :x) (m :y))
;;~ Cannot invoke "Object.getClass()" because "x" is null
```

`x` is certainly not null. So, what gives?

“x” is misleading here. It is a JVM error message. `(m :y)` is null. The error is coming from the `+` operation, not from “x”. Note that even if we use `:a` and `:b`, or `:foo` and `:bar` instead of `:x` and `:y`, we still get an error mentioning that “x is null”:

```text
$ clj
Clojure 1.12.1

user=> (def m {:a 1})
#'user/m
user=> (+ (m :a) (m :b))
Execution error (NullPointerException) at user/eval1 (REPL:1).
Cannot invoke "Object.getClass()" because "x" is null

user=> (def o {:foo 1})
#'user/o
user=> (+ (o :foo) (o :bar))
Execution error (NullPointerException) at user/eval3 (REPL:1).
Cannot invoke "Object.getClass()" because "x" is null
```

Let's investigate more:

```text
user=> (pst)
NullPointerException Cannot invoke "Object.getClass()" because "x" is null
	clojure.lang.Numbers.ops (Numbers.java:1099)
	clojure.lang.Numbers.add (Numbers.java:155)
	user/eval3 (NO_SOURCE_FILE:1)
	user/eval3 (NO_SOURCE_FILE:1)
	clojure.lang.Compiler.eval (Compiler.java:7739)
	clojure.lang.Compiler.eval (Compiler.java:7694)
	clojure.core/eval (core.clj:3232)
	clojure.core/eval (core.clj:3228)
	clojure.main/repl/read-eval-print--9248/fn--9251 (main.clj:437)
	clojure.main/repl/read-eval-print--9248 (main.clj:437)
	clojure.main/repl/fn--9257 (main.clj:459)
	clojure.main/repl (main.clj:459)
```

 The NPE (null pointer exception) comes from Numbers.ops. Looking at the first line of that method

```clojure
static Ops ops(Object x){
    Class xc = x.getClass();
```

![Clojure 1.12.1 null pointer exception: x is null](clojure-x-is-null-2025-08-06.png)

I have also recently seen this similar error about "s" being null, even though I had no "s" anywhere in my code: 

> Cannot invoke "Object.toString()" because "s" is null

Again the internal error “leaking” out. This too:

```clojure
(split ({} :f) #"-")
;~ Unhandled java.lang.NullPointerException
;~ Cannot invoke "java.lang.CharSequence.length()"
;~ because "this.text" is null
```

These are all examples of somewhat misleading errors due to the way Clojure is implemented with Java and the JVM.

- [Discord thread on the error](https://discord.com/channels/280033776820813825/310129155226337280/1400482217095991420).