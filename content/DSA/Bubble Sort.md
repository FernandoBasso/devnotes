---
tags:
  - dsa
  - sort
  - bubble-sort
---
## Intro to Bubble Sort

It is called “Bubble Sort” because the largest values _bubble up to the top_.

Compare $x_{i}$ with $x_{i + 1}$, and it case $x_{i + 1}$ is larger than $x_{i}$, swap them.

### Step by Step Example

```text
[3, 1, 4, 5, 2]
 ^
3 > 1, swap, move cursor ahead.

[1, 3, 4, 5, 2]
    ^
3 < 4, do not swap, move cursor ahead.

[1, 3, 4, 5, 2]
       ^
4 < 5, do not swap, move cursor ahead.

[1, 3, 4, 5, 2]
          ^
5 > 2, swap, move cursor ahead.

[1, 3, 4, 2, 5]
             ^
End of the collection. End of the first iteration.
```

By the end of the first iteration, the largest element has been bubbled up to the end (or to the top if you will). In the next iteration, nothing will be swapped by the largest element any longer, and it will remain at the top. The second largest element will end up at the at the last-but-one position of the array, and so on and so forth for the next iterations.

```text
This was the state of our array at the end of
the first ieration:

[1, 3, 4, 2, 5]
 ^
1 < 3, do not swap, advance the cursor.
[1, 3, 4, 2, 5]
    ^
3 < 4, do not swap, advance the cursor.

[1, 3, 4, 2, 5]
       ^
4 > 2, swap, advance the cursor.

[1, 3, 2, 4, 5]
          ^
4 < 5, do not swap, advance the cursor.
Next step is just the end again. Nothing else to do.
```

Note how now 4 and 5 are correctly positioned in ascending order at the end (or top of the array). Continue with next iteration with the current state of the array:

```text
Current state of the array from the second iteration:

[1, 3, 2, 4, 5]
 ^
1 < 3, do not swap, cursor++.

[1, 3, 2, 4, 5]
    ^
3 > 2, swap, cursor++.

[1, 2, 3, 4, 5]
       ^
3 < 4, do not swap, cursor++. At this point, the array
is already sorted, but our algorithm will continue in
the same fashion.
```

It is not so hard to understand the workings of this naive, non-optimized implementation of bubble sort. There are optimizations that can be added on top of it which will be covered later on in this post.

A naive implementation always loops from beginning to end. This is one possible implementation in JavaScript:

```javascript
function sortAsc(xs) {
  const len = xs.length;

  for (let i = 0; i < len; ++i) {
    for (let j = 0; j < len; ++j) {
      log(xs, xs[j], xs[j + 1]);
      if (xs[j] > xs[j + 1])
        swap(xs, j, j + 1);
    }
  }

  return xs;
}

//=> [ "b", "a", "d", "c", "e" ] b a
//=> [ "a", "b", "d", "c", "e" ] b d
//=> [ "a", "b", "d", "c", "e" ] d c
//=> [ "a", "b", "c", "d", "e" ] d e
//=> [ "a", "b", "c", "d", "e" ] e undefined
//=> [ "a", "b", "c", "d", "e" ] a b
//=> [ "a", "b", "c", "d", "e" ] b c
//=> [ "a", "b", "c", "d", "e" ] c d
//=> [ "a", "b", "c", "d", "e" ] d e
//=> [ "a", "b", "c", "d", "e" ] e undefined
//=> [ "a", "b", "c", "d", "e" ] a b
//=> [ "a", "b", "c", "d", "e" ] b c
//=> [ "a", "b", "c", "d", "e" ] c d
//=> [ "a", "b", "c", "d", "e" ] d e
//=> [ "a", "b", "c", "d", "e" ] e undefined
//=> [ "a", "b", "c", "d", "e" ] a b
//=> [ "a", "b", "c", "d", "e" ] b c
//=> [ "a", "b", "c", "d", "e" ] c d
//=> [ "a", "b", "c", "d", "e" ] d e
//=> [ "a", "b", "c", "d", "e" ] e undefined
//=> [ "a", "b", "c", "d", "e" ] a b
//=> [ "a", "b", "c", "d", "e" ] b c
//=> [ "a", "b", "c", "d", "e" ] c d
//=> [ "a", "b", "c", "d", "e" ] d e
//=> [ "a", "b", "c", "d", "e" ] e undefined
```

Note there are always four logs between each `undefined`. It means the iteration is working over on values that have already been previously bubbled up to the top, so, unnecessary and useless work is being performed. It always compares each element from beginning to end:

```
[ "a", "b", "c", "d", "e" ]
  ----------------------- compares all these elements on every pass
```

## Shrinking Set Optimization

The problems outlined can be handled such that the algorithm doesn’t work over elements that have already been bubbled up to the top so that each iteration works on an ever shrinking portion of the array.

- Start looping from the end of array towards the beginning with an `i` pointer.
- Inner loop with `j` pointer until `i - 1`.
- If `arr[j] > arr[j + 1]`, swap (note we are comparing an element with right sibling.
- Return sorted array.

Improved bubble sort approach:

```javascript
function sortAsc(xs) {
  const len = xs.length;

  for (let i = len - 1; i >= 0; --i) {
    for (let j = 0; j < i; ++j) {
      if (xs[j] > xs[j + 1])
        swap(xs, j, j + 1);
    }
  }

  return xs;
}

//=> [ "b", "a", "d", "c", "e" ] b a
//=> [ "a", "b", "d", "c", "e" ] b d
//=> [ "a", "b", "d", "c", "e" ] d c
//=> [ "a", "b", "c", "d", "e" ] d e
//=> [ "a", "b", "c", "d", "e" ] a b
//=> [ "a", "b", "c", "d", "e" ] b c
//=> [ "a", "b", "c", "d", "e" ] c d
//=> [ "a", "b", "c", "d", "e" ] a b
//=> [ "a", "b", "c", "d", "e" ] b c
//=> [ "a", "b", "c", "d", "e" ] a b
```

Compared to to the previous solution, this one requires a lot less iterations.

```text
[ "b", "a", "d", "c", "e" ]
  ----------------------

[ "b", "a", "d", "c", "e" ]
  ------------------

[ "b", "a", "d", "c", "e" ] swaps d and c
  -------------

[ "b", "a", "c", "d", "e" ] swaps b and a
  --------

[ "a", "b", "c", "d", "e" ]
---
```

Twenty 25 passes on the first, naive approach, and only five passes on this improved, “shrinking set” approach.

## No Swaps Optimization

Sometimes the array may already be sorted, or almost sorted, but the algorithm will continue to loop over its remaining steps, even though no more elements will be swapped.

There is a simple check that can be done to determine if the algorithm could stop: if there has not been a swap during the last pass, there will be no more swaps at all.

```tsx
function swap(
  xs: number[],
  idx1: number,
  idx2: number,
): void {
  [xs[idx1], xs[idx2]] = [xs[idx2], xs[idx1]];
}

/**
 * Sorts an array in ascending order using the bubble sort algorithm.
 *
 * This is a very good implementation such on each iteration, an ever
 * shrinking portion of the input array is worked upon and no
 * unnecessary comparisons are performed.
 *
 * Also, after each pass a check is performed to know if there has been
 * a swap in the previous pass. If there has not been a swap, it is
 * clear the array is sorted at this point and no further iterations are
 * necessary.
 *
 * - T.C: O(n) for best case scenario (array is already almost entirely
 *        sorted, but O(n²) if not.
 * - S.C: O(1).
 *
 * @sig [Number] -> [Number]
 */
export function sortAsc(xs: number[]): number[] {
  const len = xs.length;
  let noSwaps: boolean;

  for (let i = len - 1; i >= 0; --i) {
    noSwaps = true

    for (let j = 0; j < i; ++j) {
      if (xs[j] > xs[j + 1]) {
        swap(xs, j, j + 1);
        noSwaps = false;
      }
    }

    if (noSwaps) break;
  }

  return xs;
}
```

- Assume there will be swaps.
- If we ever enter the `if` conditional block, there is a swap. Make `noSwaps` false.
- At the end of the outer loop, if there was no swaps, we are done and there is no need to keep looping since we know there will be no further swaps.

## Big O of Bubble Sort

Because a sorting is being performed, the output array will always be of the same size of the input array, therefore, space complexity for bubble sort is $O(n)$.

Time complexity, though, is a bit fuzzy because it depends how more or less sorted the input already is or isn’t. It could be $O(1)$ for the best case scenario, but $O(n^2)$ otherwise.

## References

- https://visualgo.net/
- https://www.toptal.com/developers/sorting-algorithms
