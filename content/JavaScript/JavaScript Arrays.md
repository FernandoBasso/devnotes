---
tags:
  - javascript
  - array
---
## Create array of length n

```javascript
var xs = Array(5);

log(xs.length);
//=> 5

log(xs);
//=> [ <5 empty items> ]
```

## Fill array with value

Fill an array of $n$ elements with filled with `false`:
undefined

```javascript
var bools = Array(3).fill(false);

log(bools.length);
//=> 3

log(bools);
//=> [ false, false, false ]
```

This is similar to this Python snippet:

```python
memo = [False] * 3

print(len(memo))
#=> 3

print(memo)
#=> [False, False, False]
```


