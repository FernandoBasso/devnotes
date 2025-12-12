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
