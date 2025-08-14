---
tags:
  - clojure
  - function
  - reduce
  - functional-programming
description: Notes and examples on the reduce function in Clojure.
---
## Intro to reduce

As of Clojure 1.12.1, this is what the docs say about `reduce`:

```text
$ clj
Clojure 1.12.1
user=> (doc reduce)
-------------------------
clojure.core/reduce
([f coll] [f val coll])
  f should be a function of 2 arguments. If val is not supplied,
  returns the result of applying f to the first 2 items in coll, then
  applying f to that result and the 3rd item, etc. If coll contains no
  items, f must accept no arguments as well, and reduce returns the
  result of calling f with no arguments.  If coll has only 1 item, it
  is returned and f is not called.  If val is supplied, returns the
  result of applying f to val and the first item in coll, then
  applying f to that result and the 2nd item, etc. If coll contains no
  items, returns val and f is not called.
```

The classic example is to apply some arithmetic operation to a collection of zero or more values.

```clojure
(reduce + [])
;;=> 0

(reduce + 10 [2 3 5])
;;=> 20

(reduce * [])
;;=> 1

(reduce * 10 [2 3 5])
;;=> 300
```

The examples with an empty input collection return 0 and 1 respectively because that is what `+` and `*` return as their “identity”. See [Identity Property or Neutral Value of an Operation](Identity%20Property%20or%20Neutral%20Value%20of%20an%20Operation.md).

## Reduce maps

### Jedi master names

Given a collection of jedi masters hash-maps:

```clojure
(def jedi-masters
  [{:name "Yoda" :skill "The Force" :power 90}
   {:name "Ahsoka Tano" :skill "Mind Control" :power 85}
   {:name "Aayla Secura" :skill "Lightsaber" :power 84}])
```

And we want to return a modified collection of those hash-maps where the power is increased by 2:


