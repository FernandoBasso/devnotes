---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Lucky Numbers Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/lucky-numbers

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### twoSum()

> [!TIP] Number Digits
> To help understand this one, take a look at [[Number Digits (DSA)]].

For this, let's write a helper function that is able to turn an array of digits into the number the array represents.

```javascript
function digitsToNum(digits) {
  let num = 0,
        i = 0;

  while (i < digits.length)
    num = num * 10 + digits[i++];

  return num;
}

function twoSum(array1, array2) {
  return digitsToNum(array1) + digitsToNum(array2);
}
```
