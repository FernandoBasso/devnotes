---
tags:
  - clojure
  - set
  - data-structure
  - dsa
description: Notes and examples on Clojure sets.
---
## Intro
#set #dsa

Clojure contains hash sets and ordered sets. Unless otherwise noted, consider the following examples to be about hash sets (non-ordered sets).

To create a hash set using the literal or function notation:

```clojure
(def hl1 #{"Gordon Freeman" 100 :crowbar})
hl1
;=> #{"Gordon Freeman" 100 :crowbar}

(def hl2 (hash-set "Alyx Vance" 100 :emp-tool))
hl2
;=> #{"Alyx Vance" :emp-tool 100}
```

As in math sets, no duplicates. So if a set is created with duplicate values, the resulting set contains only one single instance of each value:

```clojure
(def nums (hash-set 1 2 1 2 1))
nums
;=> #{1 2}

(hash-set 1 1 1 1 1 1)
;=> #{1}
```

But duplicate keys with the literal syntax causes an error:

```clojure
(def hs #{1 1 1 1 1})
;~ java.lang.IllegalArgumentException: Duplicate key: 1
```

## Add to a set with conj
#set #conj


```clojure
(def hs1 #{:x :y})
hs
#{:y :x}

(conj hs1 :z)
;=> #{:y :z :x}
```

But if we try to add a value that already exists, it will not add a duplicate value:

```clojure
(def hs1 #{:x :y})
hs
#{:y :x}

(conj hs1 :z)
;=> #{:y :z :x}

(def hs2 (conj hs1 :x))
hs2
;=> #{:y :x}
```

## Set from other data structures
#set #vector

Create a hash set from a vector. Note the duplicates in the vector become a single value in the resulting hash set:

```clojure
(def hs (set [1 1 1 2 1 1 2]))
hs
;=> #{1 2}
```

