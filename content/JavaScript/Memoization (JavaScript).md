---
tags:
  - javascript
  - memoization
  - optimization
  - memory
  - cache
description: Some notes, tips and examples on implementing memoization in JavaScript
---
## Failed attempt 1 🤣
#memoization #gotcha

https://exercism.org/tracks/javascript/exercises/coordinate-transformation

![Exercism memoized transformation failed](exercism-memoized-transformation-failed.png)

This was my first attempt:

```javascript
function memoizeTransform(f) {
  const memo = {};

  return function memoized(x, y) {
    if (x in memo && y in memo)
      return memo.res;

    memo.x = x;
    memo.y = y;
    memo.res = f(x, y);

    return memo.res;
  };
}
```

And the tests were failing:

![Exercism memoized transformation failed test](exercism-memoized-transformation-failed-test.png)

Note my code:

```text
memo.x = x;
memo.y = y;
```

So if the memoized function was being passed 5 and 5, I was **not** creating the keys `5` and `5` in the `memo` object, but the properties `x` and `y`. So when the code tested for `x in memo && y in memo`, it would never find `5` as those keys as they were never really created.

It is returning false due to the way that `fakeTransform()` used for the tests is implemented, which is not the point of discussion for now.

Since ES6 introduced computed properties, we can store the value of a variable as a key. So if `x = 5`, `memo[x] = x` translates to `memo["5"] = 5`. And this is what we have to do to properly fix our memoized function:

```javascript
memo[x] = x;
memo[y] = y;
```
