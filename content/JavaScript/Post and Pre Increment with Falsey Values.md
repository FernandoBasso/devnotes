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

Subscript property access and happens before `++` kicks in. As `f` doesn't contain a property `z`, it returns `undefined`. Apply post `++` to `undefined` and get `NaN` as result.

Increment `NaN` with `++` and get back `NaN` as the result. `f['z']` gets assigned `NaN`.

Next time, it is the same ideas, but now `f['z']` is `NaN` rather than `undefined`, but `NaN++` is `NaN`, so, assign `NaN` to `f['z']` again. And the circle of life (or the circle of poisonous `NaN`) continues.
