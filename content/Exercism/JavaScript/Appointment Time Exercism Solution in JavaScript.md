---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Appointment Time Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/appointment-time

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

```javascript
/**
 * Create an appointment
 *
 * @param {number} days
 * @param {number} [now] (ms since the epoch, or undefined)
 *
 * @returns {Date} the appointment
 */
export function createAppointment(days, now = undefined) {
  const today = new Date(now === undefined ? Date.now() : now);
  const nDaysFromToday = today.setDate(today.getDate() + days);
  
  return new Date(nDaysFromToday);
}
```

According to the spec for this function, we should either use the provided `now`. If it is undefined, then use the current time. We used the ternary inside the de parameter list of the `Date` constructor to handle those two cases.

But, if we are willing to change the function parameter list itself, we can make `now` default to `Date.now()` instead of `undefined`. It will allow us to remove the ternary from inside the `Date` constructor parameter list:

```javascript
function createAppointment(days, now = Date.now()) {
  const today = new Date(now);
  const nDaysFromToday = today.setDate(today.getDate() + days);
  
  return new Date(nDaysFromToday);
}
```
