---
tags:
  - search
  - binary-search
---
## Intro

When the input collection is ordered, a binary search can be used.

A binary search is a means of always dividing the input in halves, and either going to the _left_ or _right_ half until the item is either found or not found at all when there is no more _halving_ to do.

Suppose the input contains 4096 elements. At most $\log_{2}(n)$  attempts will be needed. And $\log_{2}(4096) = 8$. That is way better than potentially having to try 4096 times until the item is found or the end of the input collection is exhausted completely.

> [!WARNING] Sorted input
> Remember that the binary search algorithm can only be used if the input collection is sorted in ascending order.
## Steps

To calculate the mid point:
$$mid = \lfloor lo + (hi - lo) \div{2}\rfloor$$

In JavaScript:

```javascript
var mid = Math.floor(lo + (hi - lo) / 2);
```

> [!NOTE] Alternative expression
> Because `lo` is an integer, we can floor `(hi - lo) / 2` and _then_ add that result to `lo`. That is, these two expressions evaluate to the same floored integer result:
> - $mid = \lfloor lo + (hi - lo) / 2\rfloor$
> - $mid = lo + \lfloor (hi + lo) / 2 \rfloor$
>
> After flooring, the result is an integer, and an integer added to another integer will result in an integer still.
>
> Which in JavaScript means these two expressions are the same as well:
> - `Math.floor(lo + (hi - lo) / 2)`
> - `lo + Math.floor((hi - lo)) / 2)`

Then, to get the value at the mid point:

```javascript
var val = xs[mid];
```

Then, if `val` is the value we are looking for, return `true`  or the index where the value was found and we are done.

If `val > xs[mid]`, set `lo` to `mid + 1` (`+ 1` to avoid considering `mid` again as we already know it is not the value we are looking for).

If `val < xs[mid]`, set `hi` to `mid`.

Continue repeating that while `lo < hi`.
If we don't return `true` or the index of where the value was found in the array, the loop stop executing so just return `false` (or `-1` index) at the end of the function.

An index of `-1` is sometimes called a _sentinel (or signal) value_ as it signifies the searched-for value was not found between index `[0 .. n)`.

- https://en.wikipedia.org/wiki/Sentinel_value

> [!TIP] Intervals and ranges
> When dealing with ranges, most languages treat the left/lower value as _inclusive_, and the right or higher value _exclusive_.
>
> **Be very careful with the intervals to avoid off-by-one errors**. For example, we do `while (lo < hi)`, not `while (lo <= hi)`.
>
> See [Intervals](Intervals.md).
