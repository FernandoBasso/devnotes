---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Elyses Enchantments Exercism challenge in JavaScript
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

### insertItemAtTop()

`.push()` returns the new length, so again, we first have to modify the array and *then* return it.

```javascript
function insertItemAtTop(cards, newCard) {
  cards.push(newCard);
  return cards;
}
```


### removeItem()

`splice()` returns an array with zero or more removed elements (not the modified array). Therefore, first splice and *then* return the array which is now modified.

```javascript
function removeItem(cards, position) {
  cards.splice(position, 1);
  return cards;
}
```


### removeItemFromTop()

`.pop()` drops the last element of the array the value removed. Again, first perform operation and *then* return the array.

```javascript
function removeItemFromTop(cards) {
  cards.pop();
  return cards;
}
```


### insertItemAtBottom()

`unshift(val)` inserts the new value at the beginning of the array. It causes the array to have all elements moved one index to the right, thus, `unshift()` time complexity is $O(n)$.

```javascript
function insertItemAtBottom(cards, newCard) {
  cards.unshift(newCard);
  return cards;
}
```


### removeItemAtTheBottom

`shift()` removes the first element of the array and return its value. *Then* we can return the modified array.

```javascript
 function removeItemAtBottom(cards) {
  cards.shift();
  return cards;
}
```


### checkSizeOfStack()

Simply compare if the length is the same as `stackSize`.

```javascript
function checkSizeOfStack(cards, stackSize) {
  return cards.length === stackSize;
}
```
