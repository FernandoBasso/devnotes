---
tags:
  - dsa
  - sort
---
## Intro to Sorting Algorithms

Given a collection, we know it is sorted (in ascending order), if this property holds:

$$
\mathopen{[}x_{i} \leq x_{i + 1}\mathclose{]}
$$

That is, if each element is less than or equal to the element that comes after it, then the collection is sorted (in ascending order).

Another thing to consider is that a collection of zero or one element is sorted by definition.

## ECMAScript default sort()

Deno REPL sorting examples:

```
$ deno repl
Deno 1.27.0

> ['yoda', 'luke', 'ahsoka', 'aayla', 'leia', 'vader'].sort()
[ "aayla", "ahsoka", "leia", "luke", "vader", "yoda" ]

> [10, 9, 11, 35, 7, 21].sort()
[ 10, 11, 21, 35, 7, 9 ]

```

The first sort is OK, but the second is “broken”.

> The default sort order is ascending, built upon converting the elements into strings, then comparing their sequences of UTF-16 code units values.
> 
> — MDN docs on array sort

- https://tc39.es/ecma262/#sec-array.prototype.sort.
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort.

The spec explicitly converts the values to strings, and ‘10’ comes before ‘2’ if they are converted to strings. That is the reason for the “problem”.

Thankfully, most languages allow one to provide a sorting callback function.

Deno REPL session with custom sorting function:

```
$ deno repl
Deno 1.27.0

> function compNumsAsc(x, y) { return x - y; }

> [10, 9, 11, 35, 7, 21].sort(compNumsAsc);
[ 7, 9, 10, 11, 21, 35 ]

```

That is what we want! To compare in descending order, just do `y - x` instead.

## List of Sorting Algorithms

> [!NOTE]
> This is not a complete or definitive list of sorting algorithms.

- [Bubble Sort (DSA)](Bubble%20Sort%20(DSA).md)
