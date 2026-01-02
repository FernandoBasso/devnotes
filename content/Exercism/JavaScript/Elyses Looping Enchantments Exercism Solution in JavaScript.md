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

### cardTypeCheck()

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

### determineOddEvenCards()

#### v1

```javascript
/**
 * Determine how many cards are odd or even
 *
 * @param {number[]} stack
 * @param {boolean} type the type of value to check
 * for: odd or even
 * @returns {number} number of cards that are either odd or
 * even (depending on `type`)
 */
export function determineOddEvenCards(stack, type) {
  let countEven = 0;
  let countOdd = 0;

  for (const card of stack)
    if (type && card % 2 === 0)
      ++countEven;
    else if (card % 2 === 1)
      ++countOdd;

  return type ? countEven : countOdd;
}
```


The usual if/else stuff, two counter variables, and return the correct one conditionally as well. Increment both counters even though only one of them will be returned... Works but doesn't look like the most elegant solution.

#### v2

```javascript
/**
 * @param {number} card
 * @param {boolean} type True for even, false for odd.
 * @returns {0 | 1}
 */
function oneIfEven(card, type) {
  return (type && card % 2 === 0)
    ? 1
    : 0;
}

/**
 * @param {number} card
 * @param {boolean} type True for even, false for odd.
 * @returns {0 | 1}
 */
function oneIfOdd(card, type) {
  return (!type && card % 2 !== 0)
    ? 1
    : 0;
}

/**
 * Determine how many cards are odd or even
 *
 * @param {number[]} stack
 * @param {boolean} type the type of value to check
 * for: odd or even
 * @returns {number} number of cards that are either odd or
 * even (depending on `type`)
 */
export function determineOddEvenCards(stack, type) {
  let countEven = 0;
  let countOdd = 0;

  for (const card of stack) {
    countEven += oneIfEven(card, type);
    countOdd += oneIfOdd(card, type);
  }

  return type ? countEven : countOdd;
}
```

Delegate the increment even and odd counters to dedicated functions. Makes the main function a bit shorter, but we do assignments even for the counter we'll not return, just like in the previous solution.
#### v3

```javascript
/**
 * Determine how many cards are odd or even
 *
 * @param {number[]} stack
 * @param {boolean} type the type of value to check
 * for: odd or even
 * @returns {number} number of cards that are either odd or
 * even (depending on `type`)
 */
export function determineOddEvenCards(stack, type) {
  const restType = type ? 0 : 1;
  let count = 0;

  for (const card of stack)
    if (card % 2 === restType)
      ++count;

  return count;
}
```

This is possibly one of the best approaches. Only increment the one counter and the `if` condition  together with `restType` does the main magic!

Maybe we can do the `type ? 0 : 1` logic “inline” in the `if` condition and do away with the `restType` variable:

```javascript
function determineOddEvenCards(stack, type) {
  let count = 0;

  for (const card of stack)
    if (card % 2 === (type ? 0 : 1))
      ++count;

  return count;
}
```
