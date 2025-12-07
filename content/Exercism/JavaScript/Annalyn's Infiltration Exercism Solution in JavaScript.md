---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Annalyn's Infilration Exercism challenge in Python
---
## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/annalyns-infiltration

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### canExecuteFastAttack()

Just negate the boolean parameter.

```javascript
function canExecuteFastAttack(knightIsAwake) {
  return !knightIsAwake;
}
```


