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


### birdsInWeek()

```javascript
function birdsInWeek(birdsPerDay, week) {
  let totalForWeek = 0,
      startIndex   = (week - 1) * 7,
      endIndex     = week * 7;

  while (startIndex < endIndex)
    totalForWeek += birdsPerDay[startIndex++];

  return totalForWeek;
}
```

This is not the most elegant solution, but it more performant than if we first sliced our portion of the array for the given week or something. With this approach, we simply access the elements within the given week without extra copying or slicing of the input array.

