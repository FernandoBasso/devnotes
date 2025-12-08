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
