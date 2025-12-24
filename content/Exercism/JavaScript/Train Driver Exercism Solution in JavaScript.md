---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Train Driver Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/train-driver

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

```javascript
/**
 * Return each wagon's id in form of an array.
 *
 * @param {...number} ids
 * @returns {number[]} wagon ids
 */
export function getListOfWagons(...ids) {
  return ids;
}

/**
 * Reorder the array of wagons by moving the first 2 wagons to
 * the end of the array.
 *
 * @param {Iterable<number>} ids
 * @returns {number[]} reordered list of wagons
 */
export function fixListOfWagons([id1, id2, ...ids]) {
  return [...ids, id1, id2];
}

/**
 * Fixes the array of wagons by inserting an array of wagons
 * after the first element in eachWagonsID.
 *
 * @param {Iterable<number>} ids
 * @param {Iterable<number>} missingWagons
 * @returns {number[]} corrected list of wagons
 */
export function correctListOfWagons([id1, ...ids], missingWagons) {
  return [id1, ...missingWagons, ...ids];
}

/**
 * Extend route information by adding another object
 *
 * @param {Record<string, string>} information
 * @param {Record<string, string>} additional
 * @returns {Record<string, string>} extended route information
 */
export function extendRouteInformation(information, additional) {
  return { ...information, ...additional };
}

/**
 * Separate arrival time from the route information object
 *
 * @param {Record<string, string>} information
 * @returns {[string, Record<string, string>]} array with arrival time and object without arrival time
 */
export function separateTimeOfArrival(information) {
  const { timeOfArrival, ...info} = information;
  return [timeOfArrival, { ...info }];
}
```

Of special note is the last function. When we destructure `timeOfArrival, ...info`, `timeOfArrival` does not get copied into `info` with the other properties because `timeOfArrival` was destructured individually.