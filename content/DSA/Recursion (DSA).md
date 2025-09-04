---
tags:
  - recursion
  - dsa
---
## Intro

Recursion is an approach where a function calls itself again, in a sort of a loop, until a certain state, called _the base case_ is reached thus causing the function to return the value of computation and stop recurring.

## Sum to

```typescript
/**
 * Sum the integers from 1 to (and including) n.
 */
function sumTo(n: number): number {
  if (n === 1)
    return 1;

  return n + sumTo(n - 1);
}

////
// 1
//
log(sumTo(1));
//=> 1

////
// 4 + 3 + 2 + 1
//
log(sumTo(4));
//=> 10
```

On my Arch Linux machine with Node.js 24.3.0 as of September, 2025, I was able to `sumTo(9_456)`. With `9_456` I got the (expected) error:

```text
RangeError: Maximum call stack size exceeded
```

“Expected” because ECMAScript runtimes do not support tail optimization (TCO), and there is a relatively “small” stack size for recursion.