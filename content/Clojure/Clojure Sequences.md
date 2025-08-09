---
tags:
  - clojure
  - sequence
  - seq
  - collection
---
## Intro

A sequence is a collection of elements organized in a linear order.

An abstraction can be thought of as a collection of operations that can be applied to a given type.

The _sequence abstraction_ means different collection types support the operations of the sequence abstraction. For example the built-in Clojure types like lists, vectors, hash-sets and hash-maps can all be passed to functions like `first`, `rest`, `map`, `reduce`, `filter`, `conj`, `into`, etc. That is thanks to the _sequence abstraction_.

When a function like `first` or `map` (or any of those that are part of the _sequence abstraction_) are given a collection type, Clojure performs a kind of lightweight type conversion by calling `(seq coll)` so that the sequence-related operations work on the given collection.

## Basic examples

`seq` always returns a value that looks and behaves like a list. Some examples:

List as input:
```clojure
(seq '(1 two III))

;;=> (1 two III)

(type (seq '(1 two III)))
;;=> clojure.lang.PersistentList
```

Vector as input:
```clojure
(seq [1 "two" 'III])
;;=> (1 "two" III)

(type (seq [1 "two" 'III]))
;;=> clojure.lang.PersistentVector$ChunkedSeq
```

Hash Set as input:
```clojure
(seq #{1 "two" 'III})
;;=> (III 1 "two")

(type (seq #{1 "two" 'III}))
;;=> clojure.lang.APersistentMap$KeySeq
```

Hash Map as input:
```clojure
(seq {:one 1 :two 'II})
;;=> ([:one 1] [:two II])
```

Note the returned of of a `seq`'ed hash-map is a pair, or tuple-like thing if you will. So when a map is turned into a seq, it becomes a list of pairs, or a tuple-like data structure. We say tuple-like because Clojure doesn't have actual tuple types. We can pretend a vector of two elements is a tuple, though.

And to turn the sequence back into the original type, we can use `into`:

```clojure
(type (into '() (seq '(1 two III))))
;;=> clojure.lang.PersistentList

(type (into [] (seq [1 "two" 'III])))
;;=> clojure.lang.PersistentVector

(type (into #{} (seq #{1 "two" 'III})))
;;=> clojure.lang.PersistentHashSet

(type (into {} (seq {:one 1 :two 'II})))
;;=> clojure.lang.PersistentArrayMap
```
