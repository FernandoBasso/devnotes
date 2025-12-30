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

The logic for width goes like this (and a similar idea works for height too):

- If the requested new width is less than 1, default to 1.
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

And if we *shorten* the code this much, we can do away with the private helper methods:

```javascript
/**
 * @param {Size} newSize
 */
resize(newSize) {
  const remainingWidth = this.screenSize.width - this.position.x;
  const remainingHeight = this.screenSize.height - this.position.y;

  const newWidth = Math.max(1, Math.min(remainingWidth, newSize.width));
  const newHeight = Math.max(1, Math.min(remainingHeight, newSize.height))

  this.size.resize(newWidth, newHeight);
}
```

#### move()

To move a window, we must make sure neither of its sides go off the screen. Here is the outline of the logic involved for the $x$ axis (a similar piece of logic works for the $y$ axis as well):

- Let `new_x` be the new `x` position the user wants.
- If the `new_x` is less than `0`, return `0`;
- Let `x_end` be the  `x` position of the right end of the window, which is calculated with:
	- `x_end = current_x + window_width + new_x`.
- If `x_end` is greater than the right screen edge, deduct the amount it would go over:
	- `new_max_x = new_x - (x_end - screen_width)
 - Return `new_max_x`.
 - Otherwise, `new_x` was within the limits. Just return it.

Translating to code:

```javascript
/**
 * @param {number} newX
 */
#x(newX) {
  if (newX < 0)
    return 0;

  const newWinXEnd = this.position.x + this.size.width + newX;

  if (newWinXEnd > this.screenSize.width)
    return newX - (newWinXEnd - this.screenSize.width);

  return newX;
}
```

And of course, there are ways to make it shorter:

```javascript
/**
 * @param {number} newX
 */
#x(newX) {
  const maxX = this.screenSize.width - this.size.width;

  return Math.max(0, Math.min(maxX, newX));
}

/**
 * @param {number} newY
 */
#y(newY) {
  const maxY = this.screenSize.height - this.size.height;

  return Math.max(0, Math.min(maxY, newY));
}

/**
 * @param {Position} newPosition
 */
move(newPosition) {
  const newX = this.#x(newPosition.x);
  const newY = this.#y(newPosition.y);

  this.position.move(newX, newY);
}
```

And because the private methods are now way smaller, maybe we can do away with them and write the whole logic inside the `move()` method:

```javascript
move(newPosition) {
  const maxX = this.screenSize.width - this.size.width;
  const maxY = this.screenSize.height - this.size.height;

  const newX = Math.max(0, Math.min(maxX, newPosition.x));
  const newY = Math.max(0, Math.min(maxY, newPosition.y));

  this.position.move(newX, newY);
}
```
