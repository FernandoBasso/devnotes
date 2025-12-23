---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Fruit Picker Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/fruit-picker

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

Just a matter of passing the callbacks and creating the proper message objects.

```javascript
/// <reference path="./global.d.ts" />

import { notify } from './notifier';
import { order } from './grocer';

/**
 * @return void
 */
export function onSuccess() {
  notify({ message: "SUCCESS"});
}

/**
 * @return void
 */
export function onError() {
  notify({ message: "ERROR" });
}

/**
 * @param {GrocerQuery} query
 * @param {FruitPickerSuccessCallback} onSuccessCallback
 * @param {FruitPickerErrorCallback} onErrorCallback
 * @return void
 */
export function orderFromGrocer(query, onSuccessCallback, onErrorCallback) {
  order(query, onSuccessCallback, onErrorCallback);
}

/**
 * @param {string} variety
 * @param {number} quantity
 * @return void
 */
export function postOrder(variety, quantity) {
  order({ variety, quantity }, onSuccess, onError);
}
```
