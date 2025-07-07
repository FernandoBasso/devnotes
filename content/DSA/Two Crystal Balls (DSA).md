---
tags:
  - dsa
  - search
  - dynamic-programming
---
## Problem Statement

Given two crystal balls and a building of $n$ floors, find the critical floor number in which, if dropped from there, the ball breaks. For example, if dropped from the floor 12 the ball does not break, but it does break if dropped from floor 13, then return 13. Assume the ball breaks on any floors above the critical one as well.

If no floor causes the ball to break, return -1.

> [!TIP] Search Problem
>
> The Two Balls problem is an example of a searching problem. We must figure out (search) which floor starts to cause the ball to break.
### Approach 1 Using a Single Ball

One approach to solve this is simply to keep looping from floor 1 to floor $n$ , one by one, until the critical floor is found and returned. The time complexity with this approach is $O(n)$ as in the worst case we need to iterate over the entire number of floors.

Because we keep looping incrementing by 1, we used a single ball to find the floor where it breaks and returned the index from there. We did not make use of the second ball.
### Approach 2 using the two balls

Another approach is to try in jumps of size $\lfloor\sqrt{n}\rfloor$ until a floor that breaks the ball is found. Then, jump back to the last known “good” floor and increment by 1 from there until the floor that breaks is found.

In the example below, we jump in increments of 4:

![DSA two crystal balls approach 2](two-crystal-balls-approach-2.png)

The time complexity (running time) for this approach is $\sqrt{n}$, which is not as good as a binary search time complexity of $O\log_{2}(n)$, but way better than linear search time complexity of $O(n)$.

For comparison, consider an input size of 8912:

- Linear time for  $8912$ is $8912$.
- $\sqrt{8912} \thickapprox{95}$.
- $\log_{2}(8912) \thickapprox{14}$.

Performing 95 operations is much better than performing 8912 operations!
## TypeScript

### Unit Tests
```typescript
describe("two crystal balls", () => {
  it("no floor causes the ball to break", function () {
    // The ball doesn't break from any of these floors.
    expect(twoCrystalBalls(new Array(8912).fill(false))).toEqual(-1);
  });

  it("ball breaks, large number of floors", () => {
    let breakIdx = Math.floor(Math.random() * 15e6);
    const floors = new Array(15e6).fill(false);

    for (let i = breakIdx; i < 15e6; ++i) {
      // All floors >= breakIdx are set to true to indicate
      // the ball breaks of dropped from any of those floors.
      floors[i] = true;
    }

    expect(twoCrystalBalls(floors)).toEqual(breakIdx);
  });
});
```

### Two Non-Nested Loops

```typescript
const log = console.log.bind(console);
const floor = Math.floor.bind(Math);
const sqrt = Math.sqrt.bind(Math);

/**
 * Returns the floor in which the crystal ball breaks or -1 if
 * there is no floor in which it breaks.
 */
export function twoCrystalBalls(floors: Array<number>): number {
  const len = floors.length,
        jumpSize = floor(sqrt(floors.length));
  let i = 0;

  while (1) {
    i = ((i + jumpSize) >= len)
      ? i = len
      : i + jumpSize;

    if (i === len)
      break;

    if (floors[i]) {
      i -= jumpSize;
      break;
    }
  }

  for (; i < len; ++i)
    if (floors[i])
      return i;

  return -1;
}

if (require.main === module) {
  log(twoCrystalBalls([!!0, !!0, !!0, !!0, !!1, !!1, !!1, !!1, !!1]));
}
```

