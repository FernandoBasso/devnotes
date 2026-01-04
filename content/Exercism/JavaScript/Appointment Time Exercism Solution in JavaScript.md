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

### createAppointment()

```javascript
/**
 * Create an appointment
 *
 * @param {number} days
 * @param {number} [now] (ms since the epoch, or undefined)
 *
 * @returns {Date} the appointment
 */
function createAppointment(days, now = undefined) {
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


### getAppointmentTimestamp()

```javascript
/**
 * Generate the appointment timestamp
 *
 * @param {Date} appointmentDate
 *
 * @returns {string} timestamp
 */
function getAppointmentTimestamp(appointmentDate) {
  return appointmentDate.toISOString();
}
```


### getAppointmentDetails()

```javascript
/**
 * Get details of an appointment
 *
 * @param {string} timestamp (ISO 8601)
 *
 * @returns {Record<'year'
 *                | 'month'
 *                | 'date'
 *                | 'hour'
 *                | 'minute', number>} the appointment details
 */
function getAppointmentDetails(timestamp) {
  const date = new Date(timestamp);

  return {
    year: date.getFullYear(),
    month: date.getMonth(),
    date: date.getDate(),
    hour: date.getHours(),
    minute: date.getMinutes(),
  };
}
```

### updateAppointment()

```javascript
/**
 * Update an appointment with given options
 *
 * @param {string} timestamp (ISO 8601)
 * @param {Partial<Record<'year' | 'month' | 'date' | 'hour' | 'minute', number>>} options
 *
 * @returns {Record<'year'
 *                | 'month'
 *                | 'date'
 *                | 'hour'
 *                | 'minute', number>} the appointment details
 */
export function updateAppointment(timestamp, {
  year,
  month,
  date,
  hour,
  minute,
}) {
  const d = new Date(timestamp);

  year !== undefined && d.setFullYear(year);
  month !== undefined && d.setMonth(month);
  date !== undefined && d.setDate(date);
  hour !== undefined && d.setHours(hour);
  minute !== undefined && d.setMinutes(minute);

  return getAppointmentDetails(d.toISOString());
}
```

Update the fields that were passed in. We cannot simply do something like `year || d.setFullYear(year)` because 0 is falsey. We really have to check for `undefined` explicitly.

Also note we deconstructed the `options` parameter into its constituent fields so we can have shorter lines than with dot notation, which would be like `options.year !== undefined && d.setFullYear(options.year)`.

We then use the existing `getAppointmentDetails()` to return the required object.