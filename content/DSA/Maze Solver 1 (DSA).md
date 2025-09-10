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

TODO: Show in C how this would be an array of arrays or characters to depict even more the fact that this is very like a matrix.

## Ideas on how to solve it

By “solve it” we mean find the starting point, from there find one path to the exit.

Given we are at any one point, we can move in four directions:

- Top.
- Right.
- Bottom.
- Left.

But we _cannot always_ move in those direction at will, as we cannot move:

- Out of the map (range of columns and rows).
- Into a wall.
- On a point that has been visited before (otherwise we could go back and forth between a few points forever).
- It is a point we have been before.

Those are base cases which mean the path we were exploring didn't get us to an exit, and therefore we must stop and “return” so another path can be explored.


Loop:

When a 2D array is traversed, either the columns or the rows can be visited first.


When the function is recursing, it is not known what happens after the recursive call