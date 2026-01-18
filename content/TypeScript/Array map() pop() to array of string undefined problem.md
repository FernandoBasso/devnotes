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

### for of loop

```javascript
/**
 * Lists the unique artists in a playlist.
 *
 * @param {string[]} playlist
 * @returns {string[]} list of artists
 */
export function listArtists(playlist) {
  const artists = [];

  for (const track of playlist) {
    const artist = track.split("- ").pop();

    artist && artists.push(artist);
  }

  return [...new Set(artists)];
}
```


### Single loop with reduce()

```javascript
/**
 * Lists the unique artists in a playlist.
 *
 * @param {string[]} playlist
 * @returns {string[]} list of artists
 */
export function listArtists(playlist) {
  return [...new Set(
    playlist.reduce(
      /**
       * @param {string[]} artistsAcc
       * @param {string} track
       * @returns {string[]}
       */
      function parseArtists(artists, track) {
        const artist = track.split(" - ").pop();

        if (artist)
          artists.push(artist);

        return artists;
    }, [])
  )];
}
```

Now instead of doing an extra loop to filter, we do a conditional inside the single reduce iteration. The `artist` in `if (artist)` has a type of `string | undefined`, so the condition is true only when `artist` is a (non-empty) string. So we know we are not pushing `undefined` to `artists`.

And, we are using `[... new Set(/* etc */)]` to turn the set into an array. It is an alternative to using`Array.from()`.