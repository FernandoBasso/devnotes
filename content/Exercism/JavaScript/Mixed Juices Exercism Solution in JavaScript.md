---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Mixed Juices Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

-

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### timeToMixJuice()

Simply use a switch case and return the correct time according to the name of the juice:

```javascript
function timeToMixJuice(name) {
  switch (name) {
    case "Pure Strawberry Joy":
      return 0.5;
    case "Energizer":
    case "Green Garden":
      return 1.5;
    case "Tropical Island":
      return 3;
    case "All or Nothing":
      return 5;
    default:
      return 2.5;
  }
}
```


### remainingOrders()

Loop over each order and subtract the amount each order takes from `timeLeft` until there are no more time left, or no more orders to prepare.

Even if an order takes 2.5 minutes, but Li's shift ens in 1 minute, she will work a bit extra to finish the current order nonetheless.

In the end, return the slice of the array with the remaining orders, that is, from the current `i` to the end of the array. If the array `i` already points to the last order, it will simply slice an empty array, which satisfies the requirements of this function.

```javascript
function remainingOrders(timeLeft, orders) {
  let i = 0;

  while (timeLeft > 0 && orders.length > 0)
    timeLeft -= timeToMixJuice(orders[i++]);

  return orders.slice(i);
}
```