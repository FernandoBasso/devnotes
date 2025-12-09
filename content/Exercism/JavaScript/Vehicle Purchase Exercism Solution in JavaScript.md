---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Vehicle Purchase Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/vehicle-purchase

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### needsLicense()

The most basic, beginner-like approach (which sure, also works fine):

```javascript
function needsLicense(kind) {
  if (kind === "car" || kind === "truck")
    return true;
  else
    return false;
}
```

And we don't need the `else`. We can simply return `false` in case the `if` condition doesn't match:

```javascript
function needsLicense(kind) {
  if (kind === "car" || kind === "truck")
    return true;

  return false;
}
```

In truth, the if/else conditions are redundant for this case, and we use the fact that the comparison expressions already produce boolean values:

```javascript
function needsLicense(kind) {
  return kind === "car" || kind === "truck";
}
```

And we could use an array of the kinds of vehicles that require a license to operate and use the `.includes()` method, which also returns a boolean:

```javascript
function needsLicense(kind) {
  return ["car", "truck"].includes(kind);
}
```


### chooseVehicle()

Compare which string “comes first in dictionary order” with the the “less than” `<` operator and concatenate the better choice with the string.

```javascript
function chooseVehicle(option1, option2) {
  const choice = option1 < option2
    ? option1
    : option2;

  return choice + " is clearly the better choice.";
}
```

We can avoid the intermediate `choice` variable and do the condition *and* the concatenation in the return expression:

```javascript
function chooseVehicle(option1, option2) {
  return (
    option1 < option2
      ? option1
      : option2
  ) + " is clearly the better choice.";
}
```

But honestly, even though it may look a little more clever, it makes the code less readable and understandable. For example, we had to surround the ternary condition with parentheses otherwise the `+ ...` concatenation would only apply to `option2`, or we would have to do the same concatenation twice:

```javascript
function chooseVehicle(option1, option2) {
  return  option1 < option2
    ? option1 + " is clearly the better choice."
    : option2 + " is clearly the better choice.";
}
```
