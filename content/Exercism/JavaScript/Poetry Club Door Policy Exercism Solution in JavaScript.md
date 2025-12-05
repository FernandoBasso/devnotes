---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Poetry Club Door Policy Exercism challenge in Python
---
## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/poetry-club-door-policy

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### frontDoorResponse()

The idea is to always return the first character of the line string. The challenge mentions we should use `String.prototype.slice()`.

```javascript
function frontDoorResponse(line) {
  return line.slice(0, 1);
}
```

But it is also possible to access the first char with at index 0, like an array:

```javascript
function frontDoorResponse(line) {
  return line[0];
}
```

> [!WARN] Strings are immutable
> 
> We can access a string character at a given index, but we cannot replace it. This does not work:
>
> ```javascript
> var s = "soda";
> s[0] = "Y";
> // s is still "soda", not "Yoda".
> ```
>
> The above will silently fail or with an error if strict mode is active (and ES Modules are in strict mode by default).

