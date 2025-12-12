---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Bird Watcher Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/bird-watcher

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### totalBirdCount()

```javascript
function totalBirdCount(birdsPerDay) {
  let total = 0;

  for (let i = 0; i < birdsPerDay.length; ++i)
    total += birdsPerDay[i];

  return total;
}
```

There are other ways to do it with `forEach()` or `reduce()`, but since the exercise is about increment and decrement, this solution is OK.


