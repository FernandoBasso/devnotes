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

Note that we cannot simply do:

```javascript
if (!timer)
  return "You forgot to set the timer.";
```

Why not? Because 0 is falsey in a boolean context, so when `timer` is 0, `!timer` becomes `!0`, which is `true`, so we would return the wrong message when `timer` is 0.


