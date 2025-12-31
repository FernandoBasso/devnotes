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

```text
                  <------------------- screenSize.width ----------------->

       ^          ┌──────────────────────────────────────────────────────┐
       |          │                                                      │
       |          │       position.x, _                                  │
       |          │       position.y   \                                 │
       |          │                     \<----- size.width ----->        │
       |          │               ^      *──────────────────────┐        │
       |          │               |      │        title         │        │
       |          │               |      ├──────────────────────┤        │
screenSize.height │               |      │                      │        │
       |          │          size.height │                      │        │
       |          │               |      │       contents       │        │
       |          │               |      │                      │        │
       |          │               |      │                      │        │
       |          │               v      └──────────────────────┘        │
       |          │                                                      │
       |          │                                                      │
       v          └──────────────────────────────────────────────────────┘
```

## Solution

### Size() and resize()

```javascript
/**
 * @param {number} height
 * @param {number} width
 */
function Size(width = 80, height = 60) {
  this.width = width;
  this.height = height;
}

/**
 * @param {number} width
 * @param {number} height
 */
Size.prototype.resize = function resize(width, height) {
  this.width = width;
  this.height = height;
}
```

### Position() and move()

```javascript
/**
 * @param {number} x
 * @param {number} y
 */
function Position(x = 0, y = 0) {
  this.x = x;
  this.y = y;
}

/**
 * @param {number} x
 * @param {number} y
 */
Position.prototype.move = function move(x, y) {
  this.x = x;
  this.y = y;
}
```

### ProgramWindow class

We'll use `Math.max()` and `Math.min()` in the `resize()` and `move()` methods a few times, so let's define shorter names for them:

```javascript
const max = Math.max.bind(Math);
const min = Math.min.bind(Math);
```

```javascript
class ProgramWindow {
  constructor() {
    this.screenSize = new Size(800, 600);
    this.size = new Size();
    this.position = new Position();
  }
  ...
}
```
#### resize()

Let's consider how to handle resizing the width (the same logic applies for the height).

Example:

```text
screen_width = 800
app_window_position_x = 300

max_width = screen_width - app_window_position_x
max_width =          800 - 300
max_width =             500
```

Therefore, if the app window starts at `x = 300`, its max width can be `500`, as it is the remaining space to the right of the `x`.

So if the user requests for a width greater than `500`, it is impossible, so we cap it at `500`. If they request a width less than `1`, it is impossible as well. Make it `1`. Otherwise, the width they requested is OK.

Translating into code:

```javascript
/**
 * @param {Size} newSize
 */
resize(newSize) {
  let { width: newWidth, height: newHeight } = newSize;

  if (newWidth < 1)
    newWidth = 1;

  if (newHeight < 1)
    newHeight = 1;

  const maxWidth = this.screenSize.width - this.position.x;
  const maxHeight = this.screenSize.height - this.position.y;

  if (newWidth > maxWidth)
    newWidth = maxWidth;

  if (newHeight > maxHeight)
    newHeight = maxHeight;

  this.size.resize(newWidth, newHeight);
}
```

Not too elegant but it works. In any case, we can improve it by using `min()` and `max()` we defined earlier and “hide” all these conditionals behind a more clever approach:

```javascript
/**
 * @param {Size} newSize
 */
resize({ width: requestedWidth, height: requestedHeight }) {
  const maxWidth = this.screenSize.width - this.position.x;
  const maxHeight = this.screenSize.height - this.position.y;

  const newWidth = max(1, min(maxWidth, requestedWidth));
  const newHeight = max(1, min(maxHeight, requestedHeight));

  this.size.resize(newWidth, newHeight);
}
```

We destructure and rename `width` and `height` in the function parameter list itself. Still calculate the max width and height, and then use the `max()` and `min()` to replicate the same logic.

For example, `max(1, min(maxWidth, requestedWidth))` will return `1` in case the user requested a negative width, as `min(maxWidth, requestedWidth)` would return the negative requested width, but then `max(1, someNegativeWidth)` returns `1`. Very neat!

#### move()

To move the window, we have to consider the screen width and the app window width. Based on those, we can determine the max x and y we can move the window to. Let's examine an example for moving the app window on the `x` axis, as it is the same logic for `y`.

```text
screen_width = 800
app_window_width = 500

max_x = screen_width - app_window_width
max_x =          800 - 500
max_x =             300
```

It is possible to position the app window `x` at most on `300`, as anything larger than that causes the right edger of the app window to fall of the right edge of the screen, e.g.: `300 + 500 = 800`. But `301 + 500 = 801`. `801` is one pixel off the screen edge.

With that information, we can think about the rest of the logic. If the new `x` is less than `0` (off the left edge of the screen), make it `0`. If it is greater than `max_x`, cap it to `max_x` to not cause the app window right edge fall off the screen right edge. Otherwise, the new requested `x` position is fine.

#### changeWindow()

## Putting it all together

```javascript
const max = Math.max.bind(Math);
const min = Math.min.bind(Math);

function Size(width = 80, height = 60) {
  this.width = width;
  this.height = height;
}

/**
 * @param {number} width
 * @param {number} height
 */
Size.prototype.resize = function resize(width, height) {
  this.width = width;
  this.height = height;
};

function Position(x = 0, y = 0) {
  this.x = x;
  this.y = y;
}

/**
 * @param {number} x
 * @param {number} y
 */
Position.prototype.move = function move(x, y) {
  this.x = x;
  this.y = y;
};

class ProgramWindow {
  constructor() {
    this.screenSize = new Size(800, 600);
    this.size = new Size();
    this.position = new Position();
  }

  /**
   * @param {Size} newSize
   */
  resize(newSize) {
    const maxW = this.screenSize.width - this.position.x;
    const maxH = this.screenSize.height - this.position.y;

    let newW = max(1, min(newSize.width, maxW));
    let newH = max(1, min(newSize.height, maxH));

    this.size.resize(newW, newH);
  }

  /**
   * @param {Position} newPos
   */
  move(newPos) {
    const maxX = this.screenSize.width - this.size.width;
    const maxY = this.screenSize.height - this.size.height;

    const newX = max(0, min(maxX, newPos.x));
    const newY = max(0, min(maxY, newPos.y));

    this.position.move(newX, newY);
  }
}

/**
 * @param {ProgramWindow} programWindow
 */
function changeWindow(programWindow) {
  const size = new Size(400, 300);
  const position = new Position(100, 150);

  programWindow.resize(size);
  programWindow.move(position);

  return programWindow;
}

export { Size, Position, ProgramWindow, changeWindow };
```
