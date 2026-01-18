---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Ozan's Playlist Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/ozans-playlist

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

The idea is basically this:
- Convert the array input to a set with `new Set(myArr)`.
- Apply some set-related method.
- Convert the set back to an array to return with `Array.from(mySet)`.

```javascript
/**
 * Removes duplicate tracks from a playlist.
 *
 * @param {string[]} playlist
 * @returns {string[]} new playlist with unique entries
 */
export function removeDuplicates(playlist) {
  return Array.from(new Set(playlist));
}

/**
 * Checks whether a playlist includes a track.
 *
 * @param {string[]} playlist
 * @param {string} track
 * @returns {boolean} whether the track is in the playlist
 */
export function hasTrack(playlist, track) {
  return new Set(playlist).has(track);
}

/**
 * Adds a track to a playlist.
 *
 * @param {string[]} playlist
 * @param {string} track
 * @returns {string[]} new playlist
 */
export function addTrack(playlist, track) {
  return Array.from(new Set(playlist).add(track));
}

/**
 * Deletes a track from a playlist.
 *
 * @param {string[]} playlist
 * @param {string} track
 * @returns {string[]} new playlist
 */
export function deleteTrack(playlist, track) {
  const coll = new Set(playlist);
  coll.delete(track);
  return Array.from(coll);
}

/**
 * Lists the unique artists in a playlist.
 *
 * @param {string[]} playlist
 * @returns {string[]} list of artists
 */
export function listArtists(playlist) {
  const artists = new Set();

  for (const track of playlist) {
    const [, artist] = track.split(" - ");

    artists.add(artist);
  }

  return Array.from(artists);
}
```

In `listArtists()`, not we simply add the artist without even doing any condition, as sets are, by definition, guaranteed to deduplicate the elements. That said, we could use a condition to verify if the set already contains that value:

```javascript
function listArtists(playlist) {
  const artists = new Set();

  for (const track of playlist) {
    const [, artist] = track.split(" - ");

    if (!artists.has(artist))
      artists.add(artist);
  }

  return Array.from(artists);
}
```

Note the `[, artist]` syntax. Because our split will result in an array with the two portions of the string, we use the lonely comma to ignore the first substring, and then assign the second substring to `artist`.

We could also get the artist without destructuring, and using `pop()` instead:

```javascript
const artist track.split(" - ").pop();
```

If we want to optimize and avoid doing two iterations (`map()` then `filter()`),  we could use  `reduce()` or a more traditional loop.

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

JSDoc was added in the callback function to satisfy `// @ts-check`.

And, we are using `[... new Set(/* etc */)]` to turn the set into an array. It is an alternative to using`Array.from()`.

And remember we are making a set out of the array as a quick means of deduplicating the elements, which is why we convert to array again when returning the final result.

### For of loop

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


> [!NOTE]
>
> See [Array map, split, pop undefined type problem](Array%20map,%20split,%20pop%20undefined%20type%20problem.md) for extra explanation on the types.
