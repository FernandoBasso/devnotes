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

### priceWithMonthlyDiscount()

Let's remember that our function gets passed the `ratePerHour`,  `numDays`, and `discount` which is a percentage but already expressed in a fractional form (e.g. 0.42). So the function has this signature (all params are numbers):

```javascript
function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  // ...
}
```

#### Approach 1

For one thing, we need to figure out how many “full months” (of 22 days of work) we have, and also the remaining days that don't make up a full 22-day work month.

```javascript
const fullMonths = Math.floor(numDays / 22);
const remainingDays = numDays % 22;
```

We floor the result of the division as we want “full months”, and we capture the fractional remainder of the division as the remaining days.

Then we calculate how much is the rate for those full months. Multiply the number of full months by 22 (as we work 22 days), and multiply that result by the day rate (which we already have a function for):

```javascript
const fullMonthsRate = fullMonths * 22 * dayRate(ratePerHour);
```

We also have to apply the full month discount:

```javascript
const fullMonthRateWithDiscount = fullMonthsRate * (1 - discount);
```

> [!TIP] About percentages
>
>Read the [[Percentages]] article to get a better understanding of how and why it works.

Also calculate the rate for the remaining days that don't fit into a full month (and therefore do not get any discount):

```javascript
const remainingDaysRate = remainingDays * dayRate(ratePerHour);
```

Finally, add the rate for full months with discount and the remaining days rate and ceil the result.

```javascript
return Math.ceil(fullMonthsRateWithDiscount + remainingDaysRate);
```

Here's the entire function:

```javascript
function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  const fullMonths = Math.floor(numDays / 22);
  const remainingDays = numDays % 22;
  const fullMonthsRate = fullMonths * 22 * dayRate(ratePerHour);
  const fullMonthsRateWithDiscount = fullMonthsRate * (1 - discount);
  const remainingDaysRate = remainingDays * dayRate(ratePerHour);

  return Math.ceil(fullMonthsRateWithDiscount + remainingDaysRate);
}
```

Of course some of those steps can be merged together. For example, we could calculate the full month rate with discount directly:

```javascript
const fullMonthsRateWithDiscount = fullMonths * 22 * dayRate(ratePerHour) * (1 - discount);
```

But leaving these intermediate variables with good names helps to understand the whole thing a little bit more easily.

Note that we are working with remaining days and full months, and that may have come directly as a result of reading the description what this particular function is supposed to do. And we had to multiply full months by 22 and so on... But another approach is also possible. Read on.

#### Approach 2

Instead of doing the division with floor to calculate the full months, first calculate the remaining days and use that to calculate the number of days that would make up the full months, but don't convert any thing to months, instead working with days only.

Get the remaining days *first*:

```javascript
const remainingDays =  numDays % 22;
```

And derive the full days that would fit entire months:

```javascript
const fullDays = numDays - remainingDays;
```

Note that we now have a simple subtraction without needing to floor down the result of the division like we did in the other approach.

Compute the full days rate:

```javascript
const fullDaysRate = fullDays * dayRate(ratePerHour);
```

And from that apply the discount:

```javascript
const fullDaysRateWithDiscount = fullDaysRate * (1 - discount);
```

> [!TIP] About percentages
>
>Read the [[Percentages]] article to get a better understanding of how and why it works.

Calculate the remaining days rate (exactly as in approach 1):

```javascript
const remainingDaysRate = remainingDays * dayRate(ratePerHour);
```

And add both rates and round up, again, exactly like in approach1:

```javascript
return Math.ceil(remainingDaysRate + fullDaysRateWithDiscount);
```

The entire function:

```javascript
function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  const remainingDays =  numDays % 22;
  const fullDays = numDays - remainingDays;
  const fullDaysRate = fullDays * dayRate(ratePerHour);
  const fullDaysRateWithDiscount = fullDaysRate * (1 - discount);
  const remainingDaysRate = remainingDays * dayRate(ratePerHour);

  return Math.ceil(remainingDaysRate + fullDaysRateWithDiscount);
}
```

#### Approach 3

The whole thing should be renamed to more precisely convey intent:

```javascript
export 
function costWithMonthlyDiscount(hourlyRate, projectDays, montlyDiscount) {
  const BILLABLE_DAYS_PER_MONT = 22;

  const remainingDays =  projectDays % BILLABLE_DAYS_PER_MONT;
  const fullMonthDays = projectDays - remainingDays;
  const fullMonthsCost = fullMonthDays * dayRate(hourlyRate);
  const fullMonthsCostwithDiscount = fullMonthsCost * (1 - montlyDiscount);
  const remainingDaysCost = remainingDays * dayRate(hourlyRate);

  return Math.ceil(remainingDaysCost + fullMonthsCostwithDiscount);
}
```
