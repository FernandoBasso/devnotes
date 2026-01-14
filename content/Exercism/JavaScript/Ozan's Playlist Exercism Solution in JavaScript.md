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

  for (const item of playlist) {
    const [, artist] = item.split(" - ");

    artists.add(artist);
  }

  return Array.from(artists);
}
```

In `listArtists()`, not we simply add the artist without even doing any condition, as sets are, by definition, guaranteed to deduplicate the elements. That said, we could use a condition to verify if the set already contains that value:

```javascript
function listArtists(playlist) {
  const artists = new Set();

  for (const item of playlist) {
    const [, artist] = item.split(" - ");

    if (!artists.has(artist))
      artists.add(artist);
  }

  return Array.from(artists);
}
```
