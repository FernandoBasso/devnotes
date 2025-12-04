---
tags:
  - programming
  - closure
---
## Intro

A closure is a scope that is created when a function is declared inside another function, which means the inner function can access and manipulate variables from the external scope even after the outer function has returned.

## Closures for data encapsulation

### Counter factory example

```javascript
const log = console.log.bind(console);

function makeCounter() {
  let count = 0;

  return function counter() {
    return count++;
  };
}

const counter = makeCounter();

log(counter());
//=> 0

log(counter());
//=> 1

log(counter());
//=> 2

log(counter());
//=> 3

log(counter());
//=> 4
```

We call `makeCounter()` and assign its function result to `counter`. At this point, `makeCounter()` has already executed and returned, but the `count` variable inside it is still available for the returned function `counter()`.

> [!TIP] free vs bound variable
>
> Observe that we define `count` right in the beginning of `makeCounter()`. It does not come from a parameter, neither is it used in that that scope (it is used in the inner `counter()` scope only). That means `counter` is what is known as a free variable.

### Counter with custom counter modifier function

Suppose you have this `makeCounter()` implementation:

```javascript
function makeCounter(initialCount, modifyCountFn) {
  let count = initialCount;

  return function counter() {
    const countToReturn = count;

    count = modifyCountFn(count);

    return countToReturn;
  };
}
```

Now we can create customized counters that perform other operations on the counter rather than just increment by 1.

Here, it increments by one because the function we provide indeed increments by 1:

```javascript
function increment(x) {
  return x + 1;
}

const countUp = makeCounter(0, increment);

log(countUp());
//=> 0

log(countUp());
//=> 1

log(countUp());
//=> 2
```

But we can have a function that decrements by 1:

```javascript
function decrement(x) {
  return x - 1;
}

const countDown = makeCounter(2, decrement);

log(countDown());
//=> 2

log(countDown());
//=> 1

log(countDown());
//=> 0

log(countDown());
//=> -1

log(countDown());
//=> -2
```

Or increment by 3:

```javascript
const countUpBy3 = makeCounter(0, x => x + 3);

log(countUpBy3());
//=> 0

log(countUpBy3());
//=> 3

log(countUpBy3());
//=> 6
```

