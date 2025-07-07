---
tags:
  - search
  - binary-search
---
## Intro

When the input collection is ordered, a binary search can be used.

A binary search is a means of always dividing the input in halves, and either going to the _left_ or _right_ half until the item is either found or not found at all when there is no more _halving_ to do.

Suppose the input contains 4096 elements. At most $\log_{2}(n)$  attempts will be needed. And $\log_{2}(4096) = 8$. That is way better than potentially having to try 4096 times until the item is found or the end of the input collection is exhausted completely.

The time complexity of the binary search is $O(\log_{2}(n))$, which is much more performant than linear search, which has time complexity of $O(n)$.

> [!WARNING] Sorted input
> Remember that the binary search algorithm can only be used if the input collection is sorted. It can be in ascending or descending order, by the algorithm has to adjust the comparisons accordingly.
## Steps

To calculate the mid point:
$$mid = \lfloor lo + (hi - lo) \div{2}\rfloor$$

In JavaScript:

```javascript
var mid = Math.floor(lo + (hi - lo) / 2);
```

> [!NOTE] Alternative expression to calculate the mid point
> Because `lo` is an integer, we can floor `(hi - lo) / 2` and _then_ add that result to `lo`. That is, these two expressions evaluate to the same floored integer result:
> - $mid = \lfloor lo + (hi - lo) / 2\rfloor$
> - $mid = lo + \lfloor (hi - lo) / 2 \rfloor$
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

Else, if `val > xs[mid]`, set `lo` to `mid + 1` (`+ 1` to avoid considering `mid` again as we already know it is not the value we are looking for).

Otherwise, `val < xs[mid]`, set `hi` to `mid`.

Continue repeating that while `lo < hi`.
If we don't return `true` or the index of where the value was found in the array, the loop stop executing so just return `false` (or `-1` index) at the end of the function.

An index of `-1` is sometimes called a _sentinel (or signal) value_ as it signifies the searched-for value was not found between index `[0 .. n)`.

- https://en.wikipedia.org/wiki/Sentinel_value

> [!TIP] Intervals and ranges
> When dealing with ranges, most languages treat the left/lower value as _inclusive_, and the right or higher value _exclusive_.
>
> **Be very careful with the intervals to avoid off-by-one errors**. For example, we do `while (lo < hi)`, not `while (lo <= hi)`.
>
> See [Intervals and Ranges in Math and Programming](Intervals%20and%20Ranges%20in%20Math%20and%20Programming.md).


## Binary Search Number in TypeScript

### Unit Tests

```typescript
import { search } from "./search";

describe("Binary Search", () => {
  it("should find nothing if input is empty", () => {
    expect(search(1, [])).toBe(false);
  });

  it("should find the value on the very middle the first time", () => {
    expect(search(5, [1, 3, 5, 7, 9])).toBe(true);
  });

  it("finds the value on the middle of the first left half", () => {
    expect(search(2, [1, 2, 3, 4, 5, 6, 7])).toBe(true);
  });

  it("finds the value on the left of the first left half", () => {
    expect(search(1, [1, 2, 3, 4, 5, 6, 7])).toBe(true);
  });

  it("finds the value on the right of the first left half", () => {
    expect(search(3, [1, 2, 3, 4, 5, 6, 7])).toBe(true);
  });

  it("finds the value on the middle of the first right half", () => {
    expect(search(6, [1, 2, 3, 4, 5, 6, 7])).toBe(true);
  });

  it("finds the value on the left of the first right half", () => {
    expect(search(5, [1, 2, 3, 4, 5, 6, 7])).toBe(true);
  });

  it("finds the value on the right of the first right half", () => {
    expect(search(7, [1, 2, 3, 4, 5, 6, 7])).toBe(true);
  });
});
```

### Solution with do while

```typescript
const log = console.log.bind(console);
const floor = Math.floor.bind(Math);

/**
 * Binary-searches the haystack for the needle.
 *
 * ASSUME: The input is sorted.
 */
export function search(
  needle: number,
  haystack: Array<number>,
): boolean {
  let lo: number = 0,
      hi: number = haystack.length,
      val: number,
      mid: number;

  do {
    mid = floor(lo + (hi - lo) / 2);
    val = haystack[mid];

    if (needle === val) return true;
    else if (needle < val) hi = mid;
    else lo = mid + 1;
  } while (lo < hi);

  return false;
}
```

### Solution with recursion and self-invoking function

This solution follows the exact same algorithmic approach as the `do/while` solution, but it translates the loop into a recursive function call.

```typescript
const floor = Math.floor.bind(Math);
const log = console.log.bind(console);

/**
 * Binary-searches the haystack for the needle.
 *
 * ASSUME: The input is sorted.
 */
export function search(
  needle: number,
  haystack: Array<number>,
): boolean {
  return (function run(
    x: number,
    xs: Array<number>,
    lo: number,
    hi: number,
  ): boolean {
    if (lo >= hi)
      return false;

    const mid = floor(lo + (hi - lo) / 2);
    const val = haystack[mid];

    if (needle === val)
      return true;
    else if (needle < val)
      return run(x, xs, lo, mid);
    else
      return run(x, xs, mid + 1, hi);
  })(needle, haystack, 0, haystack.length);
}
```


## Binary Search Int in Go

### Unit Tests

```go
package binarysearchint

import (
  "testing"

  "github.com/stretchr/testify/assert"
)

func TestBinarySearch(t *testing.T) {
  tests := []struct {
    name     string
    target   int
    nums     []int
    expected bool
  }{
    {
      name:     "should find nothing if input is empty",
      target:   1,
      nums:     []int{},
      expected: false,
    },
    {
      name:     "should find the value on the very middle the first time",
      target:   5,
      nums:     []int{1, 3, 5, 7, 9},
      expected: true,
    },
    {
      name:     "finds the value on the middle of the first left half",
      target:   2,
      nums:     []int{1, 2, 3, 4, 5, 6, 7},
      expected: true,
    },
    {
      name:     "finds the value on the left of the first left half",
      target:   1,
      nums:     []int{1, 2, 3, 4, 5, 6, 7},
      expected: true,
    },
    {
      name:     "finds the value on the right of the first left half",
      target:   3,
      nums:     []int{1, 2, 3, 4, 5, 6, 7},
      expected: true,
    },
    {
      name:     "finds the value on the middle of the first right half",
      target:   6,
      nums:     []int{1, 2, 3, 4, 5, 6, 7},
      expected: true,
    },
    {
      name:     "finds the value on the left of the first right half",
      target:   5,
      nums:     []int{1, 2, 3, 4, 5, 6, 7},
      expected: true,
    },
    {
      name:     "finds the value on the right of the first right half",
      target:   7,
      nums:     []int{1, 2, 3, 4, 5, 6, 7},
      expected: true,
    },
  }

  for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
      assert.Equal(t, tt.expected, Search(tt.target, tt.nums))
    })
  }
}
```

### Solution with if, else if, else

```go
package binarysearchint

// Search performs a binary search of x in xs.
func Search(x int, xs []int) bool {
	lo := 0
	hi := len(xs)
	var mid int
	var val int

	for lo < hi {
		mid = lo + (hi-lo)/2
		val = xs[mid]

		if x == val {
			return true
		} else if x < val {
			hi = mid
		} else {
			lo = mid + 1
		}
	}

	return false
}
```

### Solution with switch case

```go
// Search performs a binary search of x in xs.
func Search(x int, xs []int) bool {
  lo := 0
  hi := len(xs)
  var mid int
  var val int

  for lo < hi {
    mid = lo + (hi-lo)/2
    val = xs[mid]

    switch {
    case x == val:
      return true
    case x < val:
      hi = mid
    default:
      lo = mid + 1
    }
  }

  return false
}
```

### Recursion

```go
func run(x int, xs []int, lo int, hi int) bool {
  if lo >= hi {
    return false
  }

  mid := lo + (hi-lo)/2
  val := xs[mid]

  if x == val {
    return true
  } else if x < val {
    return run(x, xs, lo, mid)
  } else {
    return run(x, xs, mid+1, hi)
  }
}

// Search performs a binary search of x in xs.
func Search(needle int, haystack []int) bool {
  return run(needle, haystack, 0, len(haystack))
}
```

