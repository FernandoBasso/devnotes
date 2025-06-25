---
tags:
  - dsa
  - array
title:
---
## Intro

An array is a contiguous memory space.

4 bytes = 32 bit number. 8 bytes = 64 bit number.

```
arr = int[3]
```

## Intro

An array is a contiguous memory space.

A 32-bit is 4 bytes * 8 = 32.

A 64-bit is 8 bytes * 8 = 64.

a[0] is 0 to 31 bits. Bit 34 to 63 is a[1].

4 bytes, 32 bit number.

Node REPL session:
```
> var a = new ArrayBuffer(6)

> a
ArrayBuffer { [Uint8Contents]: <00 00 00 00 00 00>, byteLength: 6 }
> var a8 = new Uint8Array(a)

> a8[0] = 0xff
255

> a8
Uint8Array(6) [ 255, 0, 0, 0, 0, 0 ]
```

With arrays, _insert_ means _overwrite_, or “update the value at the given index”.
An array index is replaced with whatever previous value was there (`\,0`, `NUL`).
It doesn’t “grow” the array.

`arr + width_of_the_type + offset`

_delete_ means “replace with `\0` (or `NUL`).
It doesn’t _shrink_ the array.

`NUL` means “NOT something” in this “very real spot”.
## Big O of array operations

- GET: O(1)
- SET: O(1)
- DELETE: O(1).

It is basically the `type_width * offset`. Constant time.

Constant time doesn’t mean “we do one operation”. It means, “we do a constant amount of things despite the size of input.”

## Linear search number in array
2025-06-25 16:54

### TypeScript
#### Unit tests

```typescript
import { search } from "./search";

describe("search()", () => {
  it("should find nothing if input is empty", () => {
    expect(search(1, [])).toBe(false);
  });

  it("should find if anywhere in the array", () => {
    expect(search(1, [1])).toBe(true);
    expect(search(1, [-5, 1, 3])).toBe(true);
    expect(search(1, [-5, 3, 1])).toBe(true);
  });
});
```

#### Solution

```typescript
const log = console.log.bind(console);

export function search(
  needle: number,
  haystack: Array<number>,
): boolean {
  for (const num of haystack) {
    if (num === needle) return true;
  }

  return false;
}

if (require.main === module) {
  log(search(7, []));
  log(search(7, [3, 5, 9, 7, 1]));
  log(search(7, [1, 9, 1001]));
}
```