---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Elyses Destructured Enchantments Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/elyses-destructured-enchantments

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

Because the input to all functions are tuples of two, three, etc. elements, we can simply destructure those elements into variables to satisfy the requirements of this specific challenge.

The last two functions are passed an object with two properties, which can also be destructured and renamed, like in the case of the last function.

We destructure only the things we need, sometimes ignoring tuple elements or keys in the objects.

The goal is to use destructuring to allow the body of the functions always be a single return statement and the logic is done only manipulating the position of the destructured or renamed elements.

```javascript
/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Get the first card in the given deck
 *
 * @param {Card[]} deck
 *
 * @returns {Card} the first card in the deck
 */
export function getFirstCard([card1]) {
  return card1;
}

/**
 * Get the second card in the given deck
 *
 * @param {Card[]} deck
 *
 * @returns {Card} the second card in the deck
 */
export function getSecondCard([_, card2]) {
  return card2;
}

/**
 * Switch the position of the two cards
 *
 * @param {[Card, Card]} deck
 *
 * @returns {[Card, Card]} new deck with the 2 cards swapped
 */
export function swapTwoCards([card1, card2]) {
  return [card2, card1];
}

/**
 * Rotate (shift) the position of the three cards (by one *
 * place)
 *
 * @param {[Card, Card, Card]} deck
 *
 * @returns {[Card, Card, Card]} new deck with the 3 cards
 * shifted by one position
 */
export function shiftThreeCardsAround([card1, card2, card3]) {
  return [card2, card3, card1];
}

/**
 * Grab the chosen pile from the available piles
 *
 * @param {{ chosen: Card[], disregarded: Card[] }} piles
 *
 * @returns {Card[]} the pile named chosen
 */
export function pickNamedPile({ chosen }) {
  return chosen;
}

/**
 * Swap the chosen pile for the disregarded pile and the
 * disregarded pile for the chosen pile
 *
 * @param {{ chosen: Card[], disregarded: Card[] }} piles
 * @returns {{ chosen: Card[], disregarded: Card[] }} new piles where
 * the two piles are swapped
 */
export function swapNamedPile({
  chosen: disregarded,
  disregarded: chosen,
}) {
  return { chosen, disregarded };
}
```
