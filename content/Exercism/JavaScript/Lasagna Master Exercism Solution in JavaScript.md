---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Lasagna Master Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/lasagna-master

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### cookingStatus()

```javascript
function cookingStatus(timer) {
  if (timer === undefined)
    return "You forgot to set the timer.";

  return timer === 0
    ? "Lasagna is done."
    : "Not done, please wait.";
}
```
