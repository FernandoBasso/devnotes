---
tags:
  - programming
description: Examples on how to check if a file was run directly in different programming languages.
---
## Intro

Sometimes we need to check if we are running a file directly (as opposed as being used from an import or test). This document shows examples  in some of the languages I had to do it.

## Node.js

If using CommonJS modules (`require`, `module.exports`):

```javascript
// file: src/foo.js

if (require.man === module) {
  // This file was run directly, possibly with something like:
  //
  //   $ node ./src/foo.js
}
```


If using ES Modules (`import`, `export`):

```javascript
// file: src/foo.mjs

if (import.meta.url === `file://${process.argv[1]}`) {
  // This file was run directly, possibly with something like:
  //
  //   $ node ./src/foo.mjs  
}

```

- https://nodejs.org/api/esm.html#modules-ecmascript-modules

## Deno

```typescript
// file: src/foo.ts

if (import.meta.main) {
  // This file was run directly, possibly with something like:
  //
  //   $ deno run ./src/foo.ts
}
```


## Python

```python
# file: src/foo.py

if __name__ == "__main__":
  # This file was run directly, possibly with something like:
  #
  #   $ python ./src/foo.ts
```
