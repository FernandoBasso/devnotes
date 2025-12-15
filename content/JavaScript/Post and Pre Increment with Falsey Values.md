---
tags:
  - javascript
  - increment
  - falsey
  - boolean
  - expression
description: JavaScript explanation on incrementing a numeric property on an object.
---
## Post-increment a frequency counter.

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

Assign the result of `f['z']++ || 1` to `f['z']`.

Subscript property access and happens *after* postfix increment `++` kicks in. As `f` doesn't contain a property `z`, it returns `undefined`. Apply post `++` to `undefined` and get `NaN` as result.

Increment `NaN` with `++` and get back `NaN` as the result. `f['z']` gets assigned `NaN`.

Next time, it is the same ideas, but now `f['z']` is `NaN` rather than `undefined`, but `NaN++` is `NaN`, so, assign `NaN` to `f['z']` again. And the circle of life (or the circle of poisonous `NaN`) continues.

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

Subscript property access happens *after* prefix increment `++` kicks in. As `f` doesn't contain a property `z`, it returns `undefined`, which is *falsey*, so , `1` is the result of `++f['z'] || 1`. Therefore, assign 1 to `f['z']`.

Next time, a similar thing happens. `f['z']` evals to 1 (it is not `undefined` any longer), so, `++f['z']`  increments 1 to 2, and assigns 2 to `f['z']`. And so on and so forth.