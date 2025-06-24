---
tags:
  - dsa
  - dynamic-programming
  - leetcode
---
## Intro

- https://leetcode.com/problems/word-break/

## TypeScript

### Unit tests

```typescript
import { wordBreak } from "./word_break";

describe("wordBreak()", () => {
  it("simple case 1", () => {
    expect(wordBreak("ilikedsa", ["i", "like", "dsa"])).toBe(true);
  });

  it("simple case 2", () => {
    expect(wordBreak("applepenapple", ["apple", "pen"])).toBe(true);
  });

  it("not found", () => {
    expect(
      wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]),
    ).toBe(false);
  });

  ////
  // Takes forever if the solution doesn't use a good
  // dynamic programming approach for optimization.
  //
  it("false expensive input", () => {
    expect(
      wordBreak(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
        [
          "a",
          "aa",
          "aaa",
          "aaaa",
          "aaaaa",
          "aaaaaa",
          "aaaaaaa",
          "aaaaaaaa",
          "aaaaaaaaa",
          "aaaaaaaaaa",
        ],
      ),
    ).toBe(false);
  });

  ////
  // Takes forever if the solution doesn't use a good
  // dynamic programming approach for optimization.
  //
  it("true expensive input", () => {
    expect(
      wordBreak(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        [
          "a",
          "aa",
          "aaa",
          "aaaa",
          "aaaaa",
          "aaaaaa",
          "aaaaaaa",
          "aaaaaaaa",
          "aaaaaaaaa",
          "aaaaaaaaaa",
        ],
      ),
    ).toBe(true);
  });
});
```

### Brute force (non-optimized)

```typescript
function wordBreakR(
  str: string,
  idx: number,
  words: Array<string>,
): boolean {
  if (str.length === idx) return true;

  let prefix = "";

  for (let j = idx; j <= str.length; ++j) {
    prefix += str[j];

    if (words.includes(prefix) && wordBreakR(str, j + 1, words))
      return true;
  }

  return false;
}

export function wordBreak(str: string, words: Array<string>): boolean {
  return wordBreakR(str, 0, words);
}
```

### Dynamic Programming (optimized)

```typescript
export function wordBreak(str: string, words: Array<string>): boolean {
  const n: number = str.length;
  let maxLen: number = 0;

  for (const word of words) {
    maxLen = Math.max(maxLen, word.length);
  }

  const memo: Array<boolean> = Array(n + 1).fill(false);
  memo[0] = true;

  for (let i = 1; i <= n; ++i) {
    for (let j = i - 1; j >= Math.max(0, i - maxLen); --j) {
      const seg: string = str.substring(j, i);
      if (memo[j] && words.includes(seg)) {
        memo[i] = true;
        break;
      }
    }
  }

  return memo[n];
}
```

