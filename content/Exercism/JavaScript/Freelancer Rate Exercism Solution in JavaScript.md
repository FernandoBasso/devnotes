---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the [title] Exercism challenge in Python
---
## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/freelancer-rates

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### dayRate()

Multiply the number of work hours in a day by the rate per hour.

```javascript
export function dayRate(ratePerHour) {
  return 8 * ratePerHour;
}
```

### daysInBudget()

Given a budget (amount of money), figure out how many days of work can be payed. As we already have `ratePerHour()`, we can use that to know how much money is needed to cover a day's worth of work.

Divide the budget by the day of work and discard the fractional part.

```javascript
export function daysInBudget(budget, ratePerHour) {
  return Math.floor(budget / dayRate(ratePerHour));
}
```

Truncating down (flooring down) to the nearest integer can also be done with the bitwise operator `|` (OR) and `0` (zero). E.g.:

```
$ node -i
> 41.9999 | 0
41
> Math.PI | 0
3
```

Therefore, the function `daysInBudget()` can also be implemented as this:

```javascript
export function daysInBudget(budget, ratePerHour) {
  return budget / dayRate(ratePerHour) | 0;
}
```

The precedence of  `/` is higher than the precedence of `|`, so no need to wrap the division in parentheses.

