---
tags:
  - merge
  - array
  - dsa
description: Notes, tips and examples on merging arrays.
---
## Intro

Let's implement a function that merges two arrays, keeping the sorting order of the original arrays. For example:

```text
merge([10, 30], [20, 40]);
//=> [10, 20, 30, 40]
```

Note how 20 from the second array came right after 10 and before 30 in the result, and 40 was correctly kept at the end.

## JavaScript

### Unit tests

```javascript
//
// filename: arr_merge.spec.js
//

import { merge } from "./arr_merge";

describe("Merge Sorted Arrays", () => {
  test("two empty arrays", () => {
    var xs = [];
    var ys = [];
    var res = merge(xs, ys);
    expect(res).toEqual([]);
  });

  test("single element arrays", () => {
    var xs = [1];
    var ys = [2];
    var res = merge(xs, ys);
    expect(res).toEqual([1, 2]);
  });

  test("multiple elements, same length", () => {
    var xs = [1, 3, 5];
    var ys = [2, 4, 6];
    var res = merge(xs, ys);
    expect(res).toEqual([1, 2, 3, 4, 5, 6]);
  });

  test("first array smaller than second array", () => {
    var xs = [5];
    var ys = [3, 4, 6];
    var res = merge(xs, ys);
    log(res);
    expect(res).toEqual([3, 4, 5, 6]);
  });

  test("first array larger than second array", () => {
    var xs = [1, 3, 4];
    var ys = [2, 5];
    var res = merge(xs, ys);
    expect(res).toEqual([1, 2, 3, 4, 5]);
  });
});
```

### Solution with while loops

```javascript
//
// filename: arr_merge.js
//

const log = console.log.bind(console);

/**
 * Merges xs and ys keeping their sorting order.
 *
 * @sig ([a], [a]) -> [a]
 */
export function merge(xs, ys) {
  var xsLen = xs.length,
      ysLen = ys.length,
      i = 0,
      j = 0,
      merged = Array(xsLen + ysLen);

  while (i < xsLen && j < ysLen)
    if (xs[i] < ys[j])
      merged[i + j] = xs[i++];
    else
      merged[i + j] = ys[j++];

  if (i < xsLen)
    while (i < xsLen)
      merged[i + j] = xs[i++];

  if (j < ysLen)
    while (j < ysLen)
      merged[j + i] = ys[j++];

  return merged;
}

if (import.meta.main) {
  var xs = [5];
  var ys = [3, 4, 6];
  var res = merge(xs, ys);
  log(res);
  //=> [ 3, 4, 5, 6 ]
}
```

The way the while loops are written with the `i++` and `j++` increments during assignment is reminiscent of C style. For example, instead of doing something like:

```javascript
merged[i + j] = xs[i];
i++
```

We do it in one line:

```javascript
merged[i + j] = xs[i++];
```

It works because the evaluation first computes the current value of `i` to perform the assignment, and *then* increments it. It means if we tried to use prefix increment `++i`, the logic would be wrong.