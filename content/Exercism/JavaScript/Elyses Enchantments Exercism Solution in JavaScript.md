---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Elyses Enchantments Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/elyses-enchantments

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### getItem()

```javascript
function getItem(cards, position) {
  return cards[position];
}
```

Other ways could be using `.at(idx)`, `.slice(idx, idx + 1)`, or regex, but hard to imagine why we would do it.

### setItem()

Using subscript notation:

```javascript
function setItem(cards, position, replacementCard) {
  cards[position] = replacementCard;
  return cards;
}
```

Assigning a value to an array index returns the value assigned (not the reference to the updated array), which is why we first have to assign, *then* return the array.

We can do it with `splice()`, which returns an array of the elements removed and inserts 0 or more elements (if provided) in the place of the removed ones:

```javascript
function setItem(cards, position, replacementCard) {
  cards.splice(position, 1, replacementCard);
  return cards;
}
```

Here too, `splice()` returns the removed elements, which is why we first call `splice()` to update the array, and *then* return the modified array.

But again, we should probably stick with the simpler subscript notation.