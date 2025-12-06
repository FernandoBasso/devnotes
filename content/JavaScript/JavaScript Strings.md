---
tags:
  - javascript
  - string
description: Notes, tips and examples on common string operations in JavaScript.
---
## Last element

### .at(idx)

```javascript
"Yoda".at(-1);
//=> a
```

### .slice()

```javascript
const s = "Yoda";
s.slice(s.length - 1);
//=> a
```

Beware that `s.length` says the length of a string, but because both strings and arrays indexes start at 0 (zero), to access the index of the last element, it should be `length - 1`.

### subscript \[idx\] notation

```javascript
"Yoda"[3];
//=> a

const s = "Yoda";
s[s.length - 1];
//=> a
```

Again we have to use `length - 1`.

### RegExp

```javascript
const jedi = "Yoda";

const result = jedi.match(/.$/);
// Result is an array:
// [ 'a', index: 3, input: 'Yoda', groups: undefined ]

// The first element of that array is the matched portion, if any.
result[0];
//=> a
```
