---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Elyses Looping Enchantments Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/elyses-looping-enchantments

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### cardTypeCheck

```javascript
/**
 * Determine how many cards of a certain type there are
 * in the* deck
 *
 * @param {number[]} stack
 * @param {number} card
 *
 * @returns {number} number of cards of a single type there
 * are in the deck
 */
export function cardTypeCheck(stack, card) {
  let count = 0;

  stack.forEach(function incCountIfMatch(currentCard) {
    if (currentCard === card)
      ++count;
  });

  return count;
}
```

