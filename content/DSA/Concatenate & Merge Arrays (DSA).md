---
tags:
  - concat
  - array
  - dsa
description: Notes, tips and examples on concatenating arrays.
---
## Intro

Imagine a given programming language does not have a `concat` or `merge` function. How would we go about implementing such functions ourselves? What about merging two arrays? 

A few approaches come to mind, and their applications may depend on the programming language in question, especially when it comes to memory management, like if the language allocates memory transparently (behind the scenes) or the programmer has to do it manually.
## Concat two arrays of the same length

Depending on the language, we would have to allocate memory based on the sum of the sizes of both arrays.

### JavaScript

#### Unit tests with Jest


```javascript
//
// filename: arr_concat.spec.js
//

import { concat } from "./arr_concat";

describe("concat()", () => {
  test("two empty arrays", () => {
    expect(concat([], [])).toEqual([]);
  });

  test("two non-empty arrays of same size", () => {
    expect(
      concat([5, 1, 0], [20, 70, 40])
    ).toEqual([5, 1, 0,  20, 70, 40]);
  });

  test("empty and non-empty", () => {
    expect(
      concat([], [50, 20, 30])
    ).toEqual([50, 20, 30]);
  });

  test("non-empty and empty", () => {
    expect(
      concat([50, 20, 30], [])
    ).toEqual([50, 20, 30]);
  });

  test("non-empty with different sizes", () => {
    expect(
      concat([50, 20], [0])
    ).toEqual([50, 20, 0]);

    expect(
      concat([50, 90, -Infinity], [0, 100, 1e2, -1e2, Infinity])
    ).toEqual([50, 90, -Infinity, 0, 100, 1e2, -1e2, Infinity]);
  });
});
```

#### Implementation 1 with whiles

This style looks a bit like C-style of doing increments in variables while using them to perform assignments.

```javascript
//
// filename: arr_concat.js
//

const log = console.log.bind(console);

export function concat(xs, ys) {
  var xsLen = xs.length,
      ysLen = ys.length,
      i = 0,
      j = 0,
      concated = Array(xsLen + ysLen);

  while (i < xsLen)
    concated[i] = xs[i++];

  while (j < ysLen)
    concated[i + j] = ys[j++];

  return concated;
}

if (import.meta.main) {
  var xs = [10, 20, 30];
  var ys = [100, 200, 300];
  var res = concat(xs, ys);
  log(res);
}

//
// $ node ./arr_concat.js 
// [ 10, 20, 30, 100, 200, 300 ]
//
```

The first `while` loop copies the `xs` elements into `concated`. Then, on the next `while`, note we do `i + j` to perform the assignment to `concated` so we continue copying/appending elements to `concated` from the point where the first loop stopped.

