---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Custom Signs Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/custom-signs

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

```javascript
function buildSign(occasion, name) {
  return `Happy ${occasion} ${name}!`;
}

function buildBirthdaySign(age) {
  return `Happy Birthday! What a ${age >= 50 ? "mature" : "young"} fellow you are.`
}

function graduationFor(name, year) {
  return `Congratulations ${name}!\nClass of ${year}`
}

function costOf(sign, currency) {
  const cost = (20 + sign.length * 2).toFixed(2);
  return `Your sign costs ${cost} ${currency}.`;
}
```
