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
