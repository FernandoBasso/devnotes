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

### limesToCut()

#### Switch case

For this one, we loop over the limes, and increment `wedges` based now many wedges the lime contains based on its size. When the number of needed wedges is reached, stop the loop and return the number of wedges to cut.

```javascript
function limesToCut(wedgesNeeded, limes) {
  if (wedgesNeeded === 0)
    return 0;

  let wedges = 0,
       toCut = 0;

  for (const lime of limes) {
    toCut += 1;

    switch (lime) {
      case "small":
        wedges += 6;
        break;
      case "medium":
        wedges += 8;
        break;
      case "large":
        wedges += 10;
        break;
    }

    if (wedges >= wedgesNeeded)
      break;
  }

  return toCut;
}
```

#### Lookup table

From many other ways to implement this, one interesting one would be to create a map or lookup table of number of wedges per lime size and avoid the switch case statement altogether. If other sizes of limes were to be introduced, simply adding it to the lookup table would be enough and no other code changes would be necessary. Here's how we would do it:

```javascript
const WEDGES_BY_SIZE = {
  "small": 6,
  "medium": 8,
  "large": 10,
};

function limesToCut(wedgesNeeded, limes) {
  if (wedgesNeeded === 0)
    return 0;

  let wedges = 0,
       toCut = 0;

  for (const lime of limes) {
    toCut += 1;
    wedges += WEDGES_BY_SIZE[lime];

    if (wedges >= wedgesNeeded)
      break;
  }

  return toCut;
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
