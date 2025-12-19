---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Lasagna Master Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/lasagna-master

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### cookingStatus()

```javascript
function cookingStatus(timer) {
  if (timer === undefined)
    return "You forgot to set the timer.";

  return timer === 0
    ? "Lasagna is done."
    : "Not done, please wait.";
}
```

Note that we cannot simply do:

```javascript
if (!timer)
  return "You forgot to set the timer.";
```

Why not? Because 0 is falsey in a boolean context, so when `timer` is 0, `!timer` becomes `!0`, which is `true`, so we would return the wrong message when `timer` is 0.

### preparationTime()
#### v1 default operator
#default-operator #es5

We are using a constant with a self-documenting name instead of using [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)).

```javascript
const AVG_PREP_TIME_PER_LAYER = 2;

function preparationTime(layers, prepTimePerLayer) {
  return layers.length * (prepTimePerLayer || AVG_PREP_TIME_PER_LAYER);
}
```

The syntax `thisThing || thatThing` means, “if this thing is truthy, use it; otherwise, use that thing.” It is called the “default operator”. Default in the sense that “if a is falsey, the default to b”, like in `a || b`.

Also note we need parenthesis around the default operator approach as `*` has higher precedence than `||`. So `a * b || c` is the same as `(a * b) || c`, which would be wrong for this case.

#### v2 default parameter value
#default #es6

Since  ES6, function parameters can have default values, which provides us another way to handle missing parameters:

If `prepTimePerLayer` is provided, use it. Otherwise,  use `AVG_PREP_TIME_PER_LAYER`.

```javascript
const AVG_PREP_TIME_PER_LAYER = 2;

function preparationTime(
  layers,
  prepTimePerLayer = AVG_PREP_TIME_PER_LAYER,
) {
  return layers.length * prepTimePerLayer;
}
```

Here we define a constant with the average preparation time and use it as a default value for the parameter `prepTimePerLayer`. If `preparationTime()` and passed the second parameter, use it. Otherwise, use `AVG_PREP_TIME_PER_LAYER` as a default value for that parameter.
