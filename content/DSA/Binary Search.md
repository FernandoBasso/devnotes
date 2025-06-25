---
tags:
  - search
  - binary-search
---
## Intro

When the input collection is ordered, a binary search can be used.

A binary search is a means of always dividing the input in halves, and either going to the _left_ or _right_ half until the item is either found or not found at all when there is no more _halving_ to do.

Suppose the input contains 4096 elements.
At most $\log_{2}(n)$  attempts will be needed.
And $\log_{2}(4096) = 8$.
That is way better than potentially having to try 4096 times until the item is found or the end of the input collection is exhausted completely.

## Steps

To calculate the mid point:
$$mid = \lfloor(lo + (hi - lo)) \div{2}\rfloor$$
In JavaScript:

```javascript
var mid = Math.floor((lo + (hi - lo)) / 2);
```

Then, to get the value at the mid point:

```javascript
var val = xs[mid];
```

Then, if `val` is the value we are looking for, return `true`  or the index where the value was found and we are done.

If `val > mid`, set `lo` to `mid + 1` (`+ 1` to avoid considering `mid` again as we already know it is not the value we are looking for).

If `val < mid`, set `hi` to `mid`.

> [!TIP] Intervals and ranges
> When dealing with ranges, most languages treat the left/lower value as _inclusive_, and the right or higher value _exclusive_.
>
> See [Intervals](Intervals.md).

