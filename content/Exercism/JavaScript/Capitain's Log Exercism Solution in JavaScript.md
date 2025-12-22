---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Capitain's Log Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/captains-log

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### randomShipRegistryNumber()

```javascript
function randomShipRegistryNumber() {
  const min = 1e3;
  const max = 1e4 - 1;
  const num = (min + Math.random() * (max - min)) | 0;

  return `NCC-${num}`;
}
```

For fun, let's use exponential notation. `1e3` is `1_000`. `1e4` is `10_000`, so `1e4 - 1` is `9999`.

### randomStardate()

Very similar to the previous one. Just different min and max numbers.

```javascript
function randomStardate() {
  const min = 41_000,
        max = 42_000;

  return (min + Math.random() * (max - min)) | 0;
}
```


### randomPlanetClass()

#### v1  with inline random logic
```javascript
function randomPlanetClass() {
  const classes = ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"];

  const ini = 0,
        end = classes.length;

  const idx = (ini + Math.random() * (end - ini)) | 0;

  return classes[idx];
}
```

#### v2 with randInt() helper function

Let's write a function that returns a random int between two values.

```javascript
/**
 * Generates a random integer between min and max.
 * 
 * ASSUME: max > min.
 *
 * @param {number} min Inclusive.
 * @param {number} max Exclusive.
 */
function randInt(min, max) {
  return (min + Math.random() * (max - min)) | 0;
}
```

Then, we can implement `randomPlanetClass()` like this:

```javascript
function randomPlanetClass() {
  const classes = ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"];

  return classes[randInt(0, classes.length)];
}
```
