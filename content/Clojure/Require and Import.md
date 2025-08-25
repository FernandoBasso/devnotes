---
tags:
  - clojure
  - require
  - import
  - namespace
  - java
  - class
---
## Require or import?

- `require` is for Clojure namespaces.
- `import` is for Java classes.

For example, `clojure.test` and `match-combinators` are some of the Clojure modules and namespace, so we `require`, something like this:

```clojure
(ns foo.bar
  (:require [clojure.test :refer :all]
            [matcher-combinators.test :refer [match?]]
            [matcher-combinators.matchers :refer [embeds equals]]))
```

On the other hand, `clojure.lang.ExceptionInfo` is a Java class, and it can be added to the current namespace with something like this:
```clojure
(import [clojure.lang ExceptionInfo])

;;;;
;; In the implementation of a function:
;;
(throw (ex-info "Oops!")

;;;;
;; Then in the tests:
;;
(is (thrown-with-msg? ExceptionInfo #"Oops"))
```
