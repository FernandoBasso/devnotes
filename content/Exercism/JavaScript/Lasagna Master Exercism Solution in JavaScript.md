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

### quantities()

#### v1 two filter loops

```javascript
function quantities(layers) {
  const noodles = layers.filter(l => l === "noodles").length;
  const sauce = layers.filter(l => l === "sauce").length;

  return {
    noodles: noodles * 50,
    sauce: sauce * 0.2,
  };
}
```

Here we loop over the `layers` array **twice** to count `nooldes` and `sauce`. Then, multiply their count by the appropriate number of grams or litters as mentioned in the challenge description. It works, but we are looping twice.

#### v2 more FP style
#filter #functional-programming 

```javascript
function makeEq(expected) {
  return function isEqToExpected(actual) {
    return expected === actual;
  };
}

const eqNoodles = makeEq("noodles");
const eqSauce = makeEq("sauce");

function quantities(layers) {
  const noodles = layers.filter(eqNoodles).length;
  const sauce = layers.filter(eqSauce).length;

  return {
    noodles: noodles * 50,
    sauce: sauce * 0.2,
  };
}
```

Here we write a manually curried function `makeEq()` that takes the expected value. Then it returns function that takes the actual value. We then partial-apply `makeEq()` to create specialized functions that know how to compare if the given param is equal "noddles" or "sauce". Finally, pass those functions to `.filter()` callback. Very neat, elegant FP style. Still looping twice over the input array, though.

#### v3 more performant single loop

```javascript
function quantities(layers) {
  const info = {
    noodles: 0,
    sauce: 0,
  };

  for (const layer of layers)
    if (layer === "noodles")
      info.noodles += 50;
    else if (layer === "sauce")
      info.sauce += 0.2;

  return info;
}
```

This one looks less elegant and FP-ish as it uses an imperative loop, and if/else conditionals. Despite that, it avoids looping twice over the input array, and is able to perform the task with a single loop!

### addSecretIngredient()

Simply push the last ingredient from the friend's list to the end of my list. We should not create new references to the arrays or return new arrays. It should all be done in place, and we cannot modify our friends list, like doing `firendsList.pop()`, for instance.

To add an new element to the end of an array (by the way, JavaScript has *dynamic arrays*, not traditional arrays in which the length cannot be increased), simply use `arr.push(val)`.

To get the last element of an array, use the index `[arr.length - 1]`.

```javascript
function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList[friendsList.length - 1]);
}
```

As of 2025, `Array.prototype.at()` is supported across all major JS engines. It accepts negative indexes to go backwards from the end of an array, so `.at(-1)` is the last element, `.at(-2)` is the last but one (penultimate) element, and so on and so forth. So here's the solution with `.at(-1)`:

```javascript
function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList.at(-1));
}
```
