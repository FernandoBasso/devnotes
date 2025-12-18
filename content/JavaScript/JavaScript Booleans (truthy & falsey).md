---
tags:
  - javascript
  - boolean
  - truthy
  - falsey
description: Tips, notes, ideas and examples on JavaScript booleans, truthy and falsey values.
---
## Falsey values

In a “boolean context”, these are all *falsey* values. In other words, in a boolean context, these are all coerced to `false`.

- false
- undefined
- null
- 0 (zero)
- "" (empty string)
- NaN

If `v` is one of those, then:

```javascript

```

### NaN

Even thought `NaN` is falsey, we cannot do `v === NaN` as `NaN` is not equal to anything, including itself. We have to use `Number.isNaN(v)` or `isNaN(v)`.