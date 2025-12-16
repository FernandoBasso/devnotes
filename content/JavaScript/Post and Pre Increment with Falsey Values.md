---
tags:
  - javascript
  - increment
  - falsey
  - boolean
  - expression
description: JavaScript explanation on incrementing a numeric property on an object.
---
## Post-increment a frequency counter

```text
> var f = {};

> f['z'] = f['z']++ || 1;
1

> f['z'] = f['z']++ || 1;
1

> f['z'] = f['z']++ || 1;
1

> f['z'] = f['z']++ || 1;
1
```

Why always 1? Explain

### Answer

Initialize `f` to an empty object.

`f['z']++ || 1` evaluates to `1` because `f['z']` is `undefiend` and `undefined || 1` evals to `1`. The `++` postfix increment happens *after* `|| 1`. `undefined++` is `NaN`, but is discarded (as it happens after `|| 1`). The outcome is that `1` is assigned to `f['z']`.

Now `f['z']` is `1`, and `f['z']++ || 1` evals to the `1` in `f['z']`, which is truthy. Again, the postfix increment `++` (being postfix) happens *after* the whole expression and assignment is performed, so the `f['z']++`, which would now increment to `2` gets discarded, and `f['z']` is simply assigned the `1` that is already in `f['z']`.

And from now on, `f['z'] = f['z']++ || 1` will continually cause the `f['z']` to be assigned to `f['z']`, and the result is always `1`. 

## Pre-increment a frequency counter.

```text
> var f = {};

> f['z'] = ++f['z'] || 1;
1

> f['z'] = ++f['z'] || 1;
2

> f['z'] = ++f['z'] || 1;
3

> f['z'] = ++f['z'] || 1;
4
```

Why, contrary to the previous example, this one does increment `f['z']` by 1 each time?

### Answer

Initialize `f` to an empty object.

Assign the result of `++f['z'] || 1` to `f['z']`.

Apply prefix increment `++` to `f['z']`, but `f['z']` is `undefined`, which is falsey, so , `1` is the result of `++f['z'] || 1`. Therefore, assign 1 to `f['z']`.

Next time, a similar thing happens. `f['z']` evals to 1 (it is not `undefined` any longer), so, `++f['z']`  increments 1 to 2, and assigns 2 to `f['z']`. And so on and so forth.
