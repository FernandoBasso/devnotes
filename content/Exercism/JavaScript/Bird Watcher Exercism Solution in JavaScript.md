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

Simply sum all the numbers in the array.

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

For this solution, we need to sum the number of birds for a given week, which means, a given 7-day portion of the array.

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


### fixBirdCountLog()

Increment the counts at position 0, 2, 4, etc. That is, increment the first, don't increment the second, increment the third, don't increment the fourth, and so on...

```javascript
function fixBirdCountLog(birdsPerDay) {
  for (let i = 0; i < birdsPerDay.length; i += 2)
    ++birdsPerDay[i];

  return birdsPerDay;
}
```

Note that instead of incrementing `i` by 1 each time and then using a conditional do do the skipping, we can be more clever and increment `i` by 2 instead, avoid the conditional, and do half of the loop iterations we would have done if `i` was incremented by 1!