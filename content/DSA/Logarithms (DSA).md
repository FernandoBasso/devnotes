---
tags:
  - math
  - logarithm
---
## Intro

A logarithm is the inverse of exponentiation.
[Math Is Fun](https://www.mathsisfun.com/algebra/logarithms.html) has a nice intro to the topic.
There is also Wikipedia, Khan Academy, etc.

Think of this question: “How many x's multiply together to make y”?
For example, “How many 2's multiply together to make 8?”
We multiply 2 three times to get 8.

- $2 \times 2 \times 2 = 8$
- $log₂(8) = 3$

Therefore, $log₂(8) = 3$.
Read as “log base 2 of 8 is 3” or “the base-2 log of 8 is 3”.
In this example, 2 is the base, and 3 is the logarithm.
8 is the number we want to get by multiplying x n times.

- log₂(num) = exp → 2<sub>exp</sub> = num
- log₂(8) = 3 → 2³ = 8

There is also log base 3, base 3, or base *e*.
But for analyzing algorithms' time and space complexity, we only care about the general trend and therefore we often omit the base.
In general, we simplify that log = log₂, (even though a logarithm MUST have a base, that is, simply "log" is not a real math operation, we can use that simplification informally).

A loose definition is that a logarithm of a number roughly measures the number of times you can divide a number by 2 before you get a value that is less than or equal to one.

See this slide from Colt Steele for some visual clue on how good logarithmic time complexity fairs in comparison with some others:

- [Colt Steele Slides on Logarithms](https://cs.slides.com/colt_steele/big-o-notation#/28/0/5)

![Colt Steele logarithms](colt-steele-logarithms.png)

Types of algorithms that sometimes involves logarithmic time and/or space complexity:

- Certain searching algorithms have logarithmic time complexity.
- Sorting algorithms (especially some of the most efficient ones).
- Recursive algorithms sometimes have logarithmic space complexity.

If we divide 4096 by 2, take that result and divide by 2 again, and so on and so forth, how many times it takes to get to 1?

- $\frac{4096}{2} = 2048$
- $\frac{2048}{2} = 1024$
- $\frac{1024}{2} = 512$
- $\frac{512}{2} = 256$
- $\frac{256}{2} = 128$
- $\frac{128}{2} = 64$
- $\frac{64}{2} = 32$
- $\frac{32}{2} = 16$
- $\frac{16}{2} = 8$
- $\frac{8}{2} = 4$
- $\frac{4}{2} = 2$
- $\frac{2}{2} = 1$

It takes 12 operations to reach 1.

In Node 22:

```
Math.log2(4096)
12
```

Also see:

- [Search Algorithms (DSA)](Search%20Algorithms%20(DSA).md)
- [Binary Search (DSA)](Binary%20Search%20(DSA).md)