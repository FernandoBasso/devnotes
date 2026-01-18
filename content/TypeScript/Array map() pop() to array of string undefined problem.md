---
tags:
  - typescript
  - array
  - string
  - map
  - pop
  - undefined
  - type-error
description: An example where we get a type error about undefined and string when converting a set back to an array.
---
## Intro

I was working on Exercism Ozan's Playlist challenge (in JavaScript with `// @ts-check` enabled):

Imagine we have this collection of Jedi metadata:

```javascript
/**
 * Lists the unique artists in a playlist.
 *
 * @param {string[]} playlist
 * @returns {string[]} list of artists
 */
function listArtists(playlist) {
  const set = new Set(
    playlist.map((track) => track.split(" - ").pop())
  );

  return Array.from(set);
  ~~~~~~
  //~ Type '(string | undefined)[]' is not assignable to type 'string[]'.
  //~   Type 'string | undefined' is not assignable to type 'string'.
  //~    Type 'undefined' is not assignable to type 'string'.ts(2322)
```

## Understanding the problem

First, `Array.prototype.split()` can return an empty array:

```javascript
"".split("");
//=> []

"a b c".split(" ", 0);
//=> []
```

Any any case, string `.split()` always returns an array, which could be empty.

Second, `.pop()` on an empty array returns `undefined`:

```text
> [].pop();
// => undefined
```

And the type definition for `Array.prototype.pop()` correctly states that it could return `undefined`.

Look:

```javascript
["A", "", "C"].map(e => e.split("").pop())
//=> [ 'A', undefined, 'C' ]
```

So you see, even though we start with an array containing only strings, we ended up with an array containing strings and undefined. We went from the type `string[]` to the type `(string | undefined)[]`, or if you prefer, from `Array<string>` to `Array<string | undefined>`.

## Solution

The solution involves filtering out the `undefined` values from the result so the types we end up with the type `string[]`, as required by the return JSDoc annotation of `listArtists()`.

```javascript
/**
 * Lists the unique artists in a playlist.
 *
 * @param {string[]} playlist
 * @returns {string[]} list of artists
 */
function listArtists(playlist) {
  const artists = new Set(
    playlist
      .map((track) => track.split(" - ").pop())
      .filter(artist => artist !== undefined)
  );

  return Array.from(artists);
}
```

If we want to optimize and avoid doing two iterations (`map()` then `filter()`),  we could use a more traditional loop or `reduce()`.

