---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Elyses Enchantments Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

-

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