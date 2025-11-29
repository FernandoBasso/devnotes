---
tags:
  - dsa
  - leetcode
  - dificulty-medium
description: Notes, tips, explanation and examples on the basic calculator II Leetcode DSA challenge.
---
## Intro

https://leetcode.com/problems/basic-calculator-ii/

## Tokenizer

One approach is to do one pass over the input string and return a collection of numbers and operators.

For example, the input:


```text
"1 - 234 / 9 * 1"
```

Would result in:

```text
[1, "-", 234, "/", 9, "*", 1]
```

And from there we apply the logic to actually compute the final result.

With this approach, we have one loop to transform the string into tokens, and another loop to actually compute the final value.

It is not too bad as it does not involve nested loops, so, conceptually the time complexity is still $O(n)$ and *not* $O(n²)$.
