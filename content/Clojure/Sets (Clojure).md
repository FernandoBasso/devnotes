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

## Check if a value exists in a set
#set #contains

### Using contains?

```clojure
(def hs #{1 2 3 5 7 9})

(contains? hs 4)
;=> false

(contains? hs 7)
;=> true
```

Note that a boolean is returned.
### Using get

```clojure
(def hs #{1 2 3 5 7 9})

(get hs 4)
;=> nil

(get hs 7)
;=> 7

(def names #{"Aayla" "Ahsoka"})

(get names "Leia")
;=> nil

(get names "Ahsoka")
;=> "Ahsoka"
```

Note that `nil` is returned when the value doesn't exist in the set, or the value is returned when the does exist in the set. It is of the utmost important that we keep this in mind. Consider, if we check whether the set contains `nil`,  then using `get` is confusing because it will return `nil` (as `nil` exists in the set). The same when checking whether `false` exists in the set. If it does, it returns `false`. These cases may be confusing. Of course, we could resort to `contains?` instead of `get` for situations like these.

### Using the set as a function

```clojure
(def names #{"Aayla" "Ahsoka"})

(names "Leia")
;=> nil

(names "Aayla")
;=> "Aayla"
```

Similar to using `get`, it either returns `nil` or the value. And the same considerations about `nil` and `false` must be accounted for.
### Using a keyword as a function

If the set contains keywords we want to look for, then we can use the keyword as a function and the set as an argument:

```clojure
(def ks #{:force :power :level})

(:points ks)
;=> nil

(:power ks)
;=> :power
```

It returns `nil` if the keyword does not exist in the set, or the keyword if it does.
