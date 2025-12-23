---
tags:
  - exercism
  - javascript
  - dsa
  - clojure
  - scope
description: Notes and solutions for the Coordinate Transformation Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/coordinate-transformation

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution


### translate2d()
```javascript
function translate2d(dx, dy) {
  return function movePoint(nx, ny) {
    return [
      dx + nx,
      dy + ny,
    ];
  };
}
```
When `translate2d(dx, dy)` is called, it returns a function that takes two numbers representing a point in the coordinate plane. The returned function still has access to the the parameters that were passed when calling the first/outer function. This is possible due to the closure that is created when the outer function *closes over* the inner function that is returned. The inner function “remembers” the scope of the outer function.

### scale2d

```javascript
function scale2d(sx, sy) {
  return function scalePoints(x, y) {
    return [
      sx * x,
      sy * y,
    ];
  };
}
```
Exactly the same situation as in `translate2d()`, just replacing `+` with `*`.

### composeTransform()

#### v1 with destructuring

```javascript
function composeTransform(f, g) {
  return function transform(x, y) {
    const [newX, newY] = f(x, y);
    const [finalX, finalY] = g(newX, newY);
	
    return [finalX, finalY];
  };
}
```

Example:

```text
const f = translate2d(-10, 20);
const g = translate2d(-10, 20);
const tr = composeTransform(f, g);
log(tr(2, 1));
//=> -8, 21
```

`tr(2, 1)` internally calls `f(2, 1)`,  which evals to `[-10 + 2, 20 + 1]`, which is `[-8, 21]`. Then we destructure that into `newX = -8` and `newY = 21`.

Call `g(-8, 21)`, which evals to `[-10 + -8, 20 + 21]`, which is `[-18, 41]`.

In this implementation, we first destructure the return values of `f()` and `g()` to have one identifier per value. For example, we destructure `f(x, y)` into `newX` and `newY` so we can pass those to `g()`, which is a function that also takes two params.

#### v2 with spread params

```javascript
function composeTransform(f, g) {
  return function transform(x, y) {
    return g(...f(x, y));
  };
}
```

Here, the same logic applies, but we are using spread instead of destructuring.  `f()` returns `[val1, val2]`, but `...[val1, val2]` becomes two individual params to `g()` because of the use of the spread operator `...`.

### memoizeTransform()

This function requires that only the last result is memoized (so it is not “true”, full-blown memoization).

```javascript
function memoizeTransform(f) {
  const memo = {};

  return function memoized(x, y) {
    if (memo.x === x && memo.y === y)
      return memo.res;

    memo.x = x;
    memo.y = y;
    memo.res = f(x, y);

    return memo.res;
  };
}
```

So I implemented it using a memo object, but other people simply used three variables instead of an object:

```javascript
function memoizeTransform(f) {
  let lastX, lastY, lastResult;

  return function memoized(x, y) {
    if (lastX === x && lastY === y)
      return lastResult;

    lastX = x;
    lastY = y;
    return lastResult = f(x, y);
  };
}
```

Here we could probably replace the word “last” with “prev” or “previous”.