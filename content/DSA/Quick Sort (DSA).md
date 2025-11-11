---
tags:
  - dsa
  - sort
  - quick-sort
  - divide-and-conquer
description: Notes, tips and examples on implementing the quick sort algorithm.
---
## Intro to quick sort

Quick sort uses the “divide & conquer” idea.

By definition, a collection with 0 or 1 elements is always sorted.

Similar to merge sort, this algorithm relies on the fact that arrays of zero or one element are sorted by definition. A pivot element is selected and the end position where it would end up in the sorted array is found. Once the pivot is placed in its proper sorting position, quick sort can work on either side of the pivot and repeat the process on ever shrinking portions of the collection.

Let's sort this array of numbers in ascending order:

```
[4, 7, 2, 1, 3, 8, 6, 5]
```

Pick 4 as the pivot (on each iteration, let's always get the first element of the partition as the pivot). Move all elements that are less than 4 to the left, and all elements that are greater than 4 to the right.

Count the numbers that are less than 4. Three elements (which would go on the positions 0, 1 and 2 of the array. So, the pivot element should be at position 3.

```
[4, 7, 8, 1, 3, 8, 6, 5]

          •
[2, 1, 3, 4 | 7, 8, 6, 5]
 ----------
```

At this point, we have two partitions. The portion to the left of the initial pivot (4) and the portion to the right of the initial pivot (4). Let’s keep working on the left partition and when done, then work on the right partition.

Pick 2 as the new pivot and repeat the process. 2 should be at position 1

```
    •
[1, 2, 3, 4 | 7, 8, 6, 5]
 ----------
```

Done on the left side. Focus on the right side.

Pick 7 as the pivot. It should be a position 6.

```
                    •
[1, 2, 3, 4 | 6, 5, 7, 8]
              ----------
```

Get 6 as the new pivot. Should be at position 5.

```
              •
[1, 2, 3, 4 | 5, 6, 7, 8]
              ----------
```

Done on the right side too.

## Pivot / partition helper for quick sort

We need a helper function that arranges elements in an array on either side of the pivot.

The function takes an array and designates an element as the pivot and rearranges the array so that all elements that are smaller than the pivot are on its left, and the elements that are greater than the pivot are on its right.

Another way to think about the pivot element is that after the helper function finishes, the pivot element is in its proper sorting position. So, the `pivot()` or `partition()` helper performs two tasks:

- Move the pivot element to its proper sorting position.
- Return the pivot element index (which is now in its correct sorting position) so quick sort can perform the same operation on the left and right sides of the collection.

No order is required on the left and right side. The only matter of import for this step is that the pivot is at its proper position (all smaller values to its left and all larger values to its right).

The helper function should work _in place_ (mutate the original array instead of making copies) and return the index of the pivot at the end.

The time complexity of quick sort partially depends on how the pivot is selected. If it is roughly the median value the performance is better, but it is not always so easy to be able to do that. Let’s initially favor simplicity always pick the first element of a partition as the pivot.

Pivot algorithm idea:

- Take three arguments: array, start index (can default to 0) and end index (can default to $length - 1$).
- Take the first element as the pivot and store its current index in a variable.
- Loop from beginning to end of the array:
    - If the pivot is greater than the current element, increment the pivot index and then swap the current element with the element on the pivot index.
- Swap the pivot with the start index and return the pivot index.

![Quick sort pivot & partition idea](quick-sort-pivot-partition-idea.png)

NOTE: During the loop, each time the pivot is greater than the current element, swap them. After the loop, at the very end, swap the pivot with the value at the start index. Only at this point will the pivot be placed in its correct position within the array.

For example:

```
var xs = [4, 7, 2, 1, 3, 8, 6, 5]

var idx = pivot(xs, 0, xs.length - 1);

// idx is 3
// xs is [2, 1, 3, 4, 7, 8, 6, 5]
```

Taking 4 as the pivot index, there are three elements elements that are less than 4, which go on positions 0, 1 and 2, so, 4 should go on position 3 in the array. The remaining elements are simply placed on the right, on positions 4, 5, 6, and 7.

```jsx
/**
 * A helper pivot function for quick sort in ascending order.
 *
 * @param {number[]} xs
 * @param {number} [ini=0]
 * @sig [Number] Number -> [Number]
 */
function pivot(xs, ini = 0, end = xs.length) {
  if (xs.length === 0) return -1;

  var p = xs[ini];
  var swpIdx = ini;

  for (var i = ini + 1; i < xs.length; ++i) {
    if (p > xs[i]) {
      // Num of elements less than p.
      ++swpIdx;
      swap(swpIdx, i, xs);
    }
  }

  swap(swpIdx, ini, xs);

  return swpIdx;
}
```

## Quick sort

Start calling the `pivot()` helper on the initial input array.

```
pivot([4, 8, 2, 1, 5, 7, 6, 3])
```

The above will result in something like this:

```
           pivot
             ^
             |
   [3, 2, 1, 4, 5, 7, 6, 8]
    -------     ----------
       /            \
      v              v
 left portion    right portion
```

Then recursively call it `pivot()` to work on the left and right portions. `pivot()` always receives the entire array (not sliced copies of the original array), but uses the indexes provided to work only on smaller portions each time. All modifications are performed _in-place_.

The base case happens when the portion being worked on is less than two elements.

```
sortAsc([4, 8, 2, 1, 5, 7, 6, 3])

                p
      [3, 2, 1, 4, 5, 7, 6, 8]
       l     r     l        r

                p
      [1, 2, 3, 4, 5, 7, 6, 8]
             l        l     r
             r

                p
      [1, 2, 3, 4, 5, 6, 7, 8]
                         l  r
```

![Quick sort example](quick-sort-example.png)
## Big O of quick sort

### Time complexity for best case scenario

By getting the first element of each decomposition as the pivot index, a best case scenario is when there are $O(\log_{2} n)$ decompositions, and $O(n)$ comparisons. Therefore, quick sort has time complexity $O(n \log_{2} n)$ on the best case scenarios (when always picking the first element of each decomposition as the pivot index).

### Time complexity for worse case scenario

Still, if getting the first element of each decomposition as the pivot index, and the array is already sorted (in ascending order in our examples so far) or almost fully sorted, then the left portion would be one element most of the time. So, instead of $O(\log_{2} n)$ decompositions as in the best case scenario, we now would have $O(n)$ decompositions. Combine that with $O(n)$ comparisons and the final time complexity is $O(n^2)$, that is quadratic time, which is very bad.

To improve the situation one could get a random index as the pivot every time, or always get something in the middle. We can mitigate the problem, reduce the chances of always getting “a bad index”, but the possibility is always there. We could potentially get many more “bad indexes” than “good indexes”.

## JavaScript quick sort implementation

```javascript
function swap(arr, p, q) {
  var tmp = arr[p];
  arr[p] = arr[q];
  arr[q] = tmp;
}

function partition(xs, ini, end) {
  var piv = xs[ini];
  var idx = ini;

  for (var i = ini + 1; i <= end; ++i) {
    if (piv > xs[i]) {
      ++idx;
      swap(xs, idx, i);
    }
  }

  swap(xs, ini, idx);

  return idx;
}

function qsort(arr, ini, end = arr.length) {
  if (ini >= end)
    return arr;

  var pidx = partition(arr, ini, end);
  qsort(arr, ini, pidx - 1);
  qsort(arr, pidx + 1, end);
}

if (require.main === module) {
  var xs = [50, 10, 20, 60, 30, 40];

  qsort(xs, 0, xs.length);
  log(xs);
}
```

The `for` loop in `partition()` can be refactored to this:

```javascript
for (var i = ini + 1; i < end; ++i)
  if (piv > xs[i])
    swap(xs, ++idx, i);
```


## References

- [https://en.wikipedia.org/wiki/Quicksort](https://en.wikipedia.org/wiki/Quicksort)
- [https://www.hackerearth.com/practice/algorithms/sorting/quick-sort/visualize/](https://www.hackerearth.com/practice/algorithms/sorting/quick-sort/visualize/)