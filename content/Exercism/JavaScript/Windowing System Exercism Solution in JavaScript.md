---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Windowing System Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/windowing-system

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### Size() and resize()

```javascript
function Size(width , height) {
  this.width = width || 80;
  this.height = height || 60;
}

Size.prototype.resize = function resize(width, height) {
  this.width = width;
  this.height = height;
}
```

Just for kicks, we are using the “default operator” idea  `val || defaultVal` to handle default values for properties.

### Position() and move()

```javascript
function Position(x = 0, y = 0) {
  this.x = x;
  this.y = y;
}

Position.prototype.move = function move(x, y) {
  this.x = x;
  this.y = y;
}
```

Here we are using the more modern default assignment for missing function/method parameters.
