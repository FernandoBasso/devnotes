---
tags:
  - javascript
  - boolean
  - truthy
  - falsey
description: Tips, notes, ideas and examples on JavaScript booleans, truthy and falsey values.
---
## Falsey values

In a “boolean context”, these are all *falsey* values. In other words, in a boolean context, these are all coerced to `false`.

- `false`
- `undefined`
- `null`
- `0` (zero)
- `""` (empty string)
- `NaN`

## indexOf() in a condition
#index-of #boolean #falsey #truthy 

```javascript

var str = "hello";
if (str.indexOf("h"))
  log("Yes");
else
  log("No");
//=> No
```

Question: Why does this code logs "No" if clearly "hello" contains the letter "h"?

Answer: Becase "h" appears at index 0, and 0 is falsey in a boolean context. This is what happens:

```text
if ("hello".indexOf("h"))

if (0)

if (Boolean(0))

if (false)
```

Then of course, the condition is always false, as 0 is falsey in a boolean context.
## NaN
#nan

Even thought `NaN` is falsey, we cannot do `v === NaN` as `NaN` is not equal to anything, including itself. We have to use `Number.isNaN(v)`, `isNaN(v)`, or `!NaN`.

```javascript
const input = "0xhf";
const num = Number.parseInt(input);

if (num === NaN)
  log("Input is not a number:", input);
else
  log("Here is your number:", num);
```

Logs “Here is your number: NaN”. `num` is indeed `NaN`, but we cannot compare if a value `NaN` with either `===` or `==`. Do one of these instead:

```javascript
if (!NaN)
  log("Input is not a number:", input);
else
  log("Here is your number: ", num);

if (Number.isNaN(num))
  log("Input is not a number:", input);
else
  log("Here is your number: ", num);
```

## isNaN() vs Number.isNaN()

The global `isNaN()` performs coercion before checking if the value is not a number. That is, if passed a string, like `"0xff"` instead of the number `0xff`, it first converts the string to a number.

But `Number.isNaN()` requires that its argument type be `number`, and it must be precisely the value `NaN`, like the result of `Number("0xHF")` or `0 / 0` or `NaN` it self. So, maybe surprisingly:

```javascript
const input = "0xHF";

if (Number.isNaN(input))
  log("Input is NOT a number:", input);
else
  log("Input IS a number:", input);
//=> Input IS a number: 0xHF
```

It executes the `else` block, even though "0xHF" is not a valid (hexadecimal) number since "H" doesn't exist in the hexadecimal number system.



