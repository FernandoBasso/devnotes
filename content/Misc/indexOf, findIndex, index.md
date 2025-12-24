---
tags:
  - index-of
  - find-index
  - index
  - collection
  - dsa
description: General notes and examples on collections, arrays, and index-related ideas and uses.
---
## JavaScript indexOf() vs findIndex() on arrays

With JavaScript arrays, we can use `.indexOf()` to get the index where an element first appears in an array, or `-1` if it cannot be found.

```javascript
const xs = [50, 30, 90];

log(xs.indexOf(50));
//=> 0

log(xs.indexOf(101));
//=> -1

var ys = [50, 30, 90, 30];
// idx:    0   1   2   3

log(ys.indexOf(30));
//=> 1
```

In the last example, even though 30 appears twice in the array, the index in which it first appears is returned.

`Array.prototype.indexOf()` compares for equality. What if we want to find an element based on some other condition that is not “being equal to a certain value”, like, find the index of the element that first satisfies the condition of being greater than some value?

For that we use `Array.prototype.findIndex(predicateFn)`.

```javascript
const nums = [50, 30, 90, 30];
// idx:       0   1   2   3

////
// Index of the first element that is greater than 50.
//
log(nums.findIndex(num => num > 50));
//=> 2

////
// Index of the first element that is less than 50.
//
log(nums.findIndex(num => num < 50));
//=> 1

////
// Index of the first element that is equal to 50.
// This is the same as indexOf(50).
//
log(nums.findIndex(num => num === 50));
//=> 0

////
// Returns -1 if no element in the array satisfies the predicate.
//
log(nums.findIndex(num => num >= 100));
//=> -1
```

### References

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex
- 