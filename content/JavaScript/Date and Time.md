---
tags:
  - javascript
  - date
  - time
description: Common date and time samples in JavaScript.
---
# Intro

Some common operations we often need to do when working with dates.

 > [!TIP] log alias
 > 
 > See [console.log, info, warn, table, error](console.log,%20info,%20warn,%20table,%20error.md) for info on why I use `log()` as you'll see in the examples.

# Seven days from a given date

Given a date, how get a new date which is seven days from a given date?

```typescript
/**
 * Returns a new date n days from the given date.
 *
 * **NOTE**: Does not modify the passed-in date in any way.
 * 
 * @param fromDate The date to compute n days from.
 * @returns The new date n days from the given date.
 */
function nDaysFrom(fromDate: Date, days: number): Date {
  const nextDate = new Date(fromDate);
  nextDate.setDate(fromDate.getDate() + days);

  return nextDate;
}

const today = new Date();
const sevenDaysFromToday = nDaysFrom(today, 7);

for (const date of [today, sevenDaysFromToday])
  log(date);
```

Output:

```text

$ deno run --check ./main.ts
2026-06-20T14:02:28.831Z
2026-06-27T14:02:28.831Z
```

So we create a function that takes a date and a number of days to add to the date. But we don't add n days to the given date itself as we don't want to mutate the passed date, but derive a new date instead and leave the given date unmodified.

Then, with the new date object derived from the given date, we use `setDate()` and `getDate()`, which despite the name, set and return the day-of-the-month using “local time”. Finally, return the computed date.

As an aside, if we wanted to change the original given date, maybe in a function like “advance n days”, then we could do something like this:

```typescript
/**
 * Adds n days to the given date.
 *
 * **NOTE**: Modifies the passed in date.
 *
 * @param date The date to add n days to.
 */
function postponeByDays(date: Date, days: number): void {
  date.setDate(date.getDate() + days);
}

const meetingDate = new Date();
log(meetingDate);

postponeByDays(meetingDate, 3);
log(meetingDate);
```

And the output:

```text
2026-06-20T14:30:31.110Z
2026-06-23T14:30:31.110Z
```

> [!NOTE] Comments
>
> Observe how the comments make it explicit how the functions handle the date logic in relation to the passed date object.
