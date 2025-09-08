---
tags:
  - dsa
  - recursion
  - maze
  - solver
description: Concepts, ideas and implementation of a simple maze solver using arrays and points to represent the maze and the solution path.
---
## Intro

- Wall: `#`. We can't walk into walls.
- Start: `S`, the starting point.
- End: `E`, the exit.

Example of a maze with a single solution:

```text
##########E#
#   #####  #
#   #     ##
##### #### #
#     ######
#S##########
```

In TypeScript, we can represent this maze as an array of strings:

```typescript
const maze: Array<string> = [
  "##########E#",
  "#   #####  #",
  "#   #     ##",
  "##### #### #",
  "#     ######",
  "#S##########",
];
```
So it is an array of 6 elements, and each element is a string of 12 characters. For all intents and purposes, we can consider this to be a 6 by 12 matrix.