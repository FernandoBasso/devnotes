---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the TITLE Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

-

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

  return (min + Math.random() * (max - min));
}
```


### randomPlanetClass()

#### v1 

```javascript
function randomPlanetClass() {
  const classes = ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"];

  const ini = 0,
        end = classes.length;

  const idx = (ini + Math.random() * (end - ini)) | 0;

  return classes[idx];
}
```
