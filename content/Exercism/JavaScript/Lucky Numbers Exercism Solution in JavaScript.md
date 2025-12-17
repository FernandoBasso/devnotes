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

### luckyNumber()

For this one we receive a number and must assert it is a palindrome or not. Do do that, first decompose the number into a collection of its digits, and perform the usual “is palindrome” algorithm.

> [!TIP] Number Digits
> Take a look at [[Number Digits (DSA)]] for more info about converting a number into a collection of its constituent digits.

### v1 with a while loop

Decompose the number into a collection of its digits and then loop comparing the first with the last element, the second with the last but one element, etc., until we either find a pair that is not equal, in which case the number is not a palindrome and return false. Else, return true as all the pairs were equal (or the number contains zero or one digit only).

```javascript
function toDigits(num) {
  let digits = [];

  while (num >= 10) {
    digits.unshift(num % 10);
    num = num / 10 | 0;
  }

  digits.unshift(num | 0);

  return digits;
}

function luckyNumber(value) {
  const digits = toDigits(value);
  let i = 0,
      j = digits.length - 1;

  while (i < j)
    if (digits[i++] !== digits[j--])
      return false;

  return true;
}
```
