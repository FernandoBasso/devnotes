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

### ProgramWindow class

The `screenSize`, `size` and `position` are all public fields.

```javascript
class ProgramWindow {
  screenSize = new Size(800, 600);
  size = new Size();
  position = new Position();
  ...  
} 
```

#### resize()

To resize the window, the challenge requires that the new size doesn't fall of the edges of the screen. Also, the position cannot be adjusted to make room for the required size.

One approach is to have the `resize()` method delegate the calculation of the width and height to dedicated private methods.

The logic for with goes like this:

- If the requested new witdh is less than 1, default to 1.
- If the requested new width is greater than the screen width, make the new width as large as the remaining width. In this case, we adapt the new width to be as large as possible, but not as large as it was originally requested.
- Otherwise, the requested new width is OK (fits the screen width).

We can translate that to this piece of code:

```javascript
/**
 * @param {number} newWidth
 * @returns {number}
 */
#width(newWidth) {
  if (newWidth < 1)
    return 1;

  const remainingWidth = this.screenSize.width - this.position.x;

  if (newWidth > remainingWidth)
    return remainingWidth;

  return newWidth;
}
```

The second `if` with the last `return` can be shortened using `Math.min()`:

```javascript
#width(newWidth) {
  if (newWidth < 1)
    return 1;

  const remainingWidth = this.screenSize.width - this.position.x;

  return Math.min(newWidth, remainingWidth);
}
```

And even further, we can handle the remaining `if` with a combination of `Math.max()` and `Math.min()`:

```javascript
#width(newWidth) {
  const remainingWidth = this.screenSize.width - this.position.x;

  return Math.max(1, Math.min(newWidth, remainingWidth));
}
```

> [!NOTE]
> I do think that for this case the first, the longer code more closely follows our mental process and would be easier to understand and maintain.

And we end up with something like this:

```javascript
/**
 * @param {number} newWidth
 * @returns {number}
 */
#width(newWidth) {
  const remainingWidth = this.screenSize.width - this.position.x;

  return Math.max(1, Math.min(newWidth, remainingWidth));
}

/**
 * @param {number} height
 * @returns {number}
 */
#height(height) {
  const remainingHeight = this.screenSize.height - this.position.y;

  return Math.max(1, Math.min(remainingHeight, height));
}

/**
 * @param {Size} newSize
 */
resize(newSize) {
  const newWidth = this.#width(newSize.width);
  const newHeight = this.#height(newSize.height);

  this.size.resize(newWidth, newHeight);
}
```
