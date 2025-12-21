---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Coordinate Transformation Exercism challenge in Python
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

