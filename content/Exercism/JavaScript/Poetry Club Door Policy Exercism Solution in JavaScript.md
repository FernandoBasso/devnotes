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

### frontDoorPassword()

```javascript
function frontDoorPassword(word) {
  const first = word.slice(0, 1).toUpperCase();
  const rest = word.slice(1).toLowerCase();
  return first + rest;
}
```

`slice(idxStart, idxEnd)` returns the characters starting `idxStart`, up to, but *not including*, `idxEnd`.

`word.slice(0, 1)` returns just the substring at index 0, but not at index 1. For example, `"hello".slice(0, 1)` returns "h", not "he".

However, `"hello".slice(1)` returns "ello", as it starts at index 1 up to the end of the string (not we did not supply a second index to `slice()`).

> [!NOTE] Strings vs Characters
>
> JavaScript does not really have a type `Char` like in some other languages. When we say *character*, we really mean a substring consisting of one element of the string.

### backDoorResponse()

```javascript
function backDoorResponse(line) {
  const trimmedLine = line.trim();
  return trimmedLine.slice(trimmedLine.length - 1);
}
```

To get the last element of a string, target the last index of the string (`str.length - 1`). But in this case, as the string may contain whitespace at the beginning or at the end of the string, we first need to get a trimmed version of the string, or `str.length - 1` will sometimes point to an index which is not really the last char (as whitespace at both sides of the string are also characters and also influence the length of the string).

On a small performance note, don't do this:

```javascript
str.trim().slice(str.trim().length - 1);
```

Maybe we'd do it to try to write more concise or elegant code, not having to assign the trimmed string to a variable. Except that then the same string is trimmed twice, which means we are performing the same computation twice.

Sometimes (or many times), the more elegant code is less performant.

And of course, since we are returning one single character from the string, accessing with `[idx]` would also work in this case (even though the lesson is about slice, trim, and these kinds of methods):

```javascript
function backDoorResponse(line) {
  const trimmedLine = line.trim();
  return trimmedLine[trimmedLine.length - 1];
}
```


### backDoorPassword()

```javascript
function backDoorPassword(word) {
  return frontDoorPassword(word) + ", please";
}
```

We already have a function that capitalizes a word, so we use that, and concatenate with `+ ", please"`.

There are other ways to do it, using interpolation with template strings, for instance:

```javascript
function backDoorPassword(word) {
  return `${frontDoorPassword(word)}, please`;
}
```

But honestly, that seems overkill for this simple scenario. The `+` string concatenation is good enough and does the job.