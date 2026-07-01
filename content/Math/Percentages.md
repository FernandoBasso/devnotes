---
tags:
  - math
  - percentage
  - percent
description: Notes and examples on common, useful percentage problems and situations
---
# Percentages | Math

## Introduction

When we say something like “16 is 20% of 80”, 16 is the *percentage* or *part*, 20 is the *percent* or *ratio*, and 80 is the *quantity* or *base*.

Let $p$ be the *part* (percentage), $r$ be the *ratio* (percent), and $b$ be the *base*.
## Add or subtract p% of a base

Suppose something costs 80 (whatever currency). How could we add 12% extra fee on top of that amount? Or how could we give a discount of 12% on that amount?



To add 12% to 80, we multiply 80 by $1 + 0.12$:

$$80 \times (1 + 0.12) = 89.6$$

To subtract 12% from 80, multiply 80 by $1 - 0.12$:

$$80 \times (1 - 0.12) = 70.4$$

$1 + 0.12$ can be thought of 100% of a number plus 12% of that number. 100 % of 80 is 80, and 12% of 80 is 9.6, therefore, 100% of 80 plus 12% of 80 is 80 + 96, which is 89.6.

Similarly, $1 - 0.12$ can be thought of 100% a number minus 12% of that number. 100% of 80 is 80 and -12% of 80 is -9.6, therefore, 100% of 80 minus -12% of 80 is 80 - 9.6, which is  70.4.

## Find the part given the ratio and the base

What is 20% of 80? We know 20 is the ratio $r$, 80 is the base $b$, and we want to find the part $p$.

The formula is:

$$
\frac{r}{100} \times b = p
$$

Substituting and solving:

* $\frac{20}{100}\times{80}=p$
* $0.2\times{80} = p$
* $16 = p$

Therefore, 20% of 80 is 16 (16 parts of 80).

## Find the ratio given the part and the base

16 is what percent of 80? We know that the part $p$ is 16, and that the base  $b$ is 80.
We want to find percent (ratio) $r$.

The formula is:

$$
\frac{p}{b}\times{100} = r
$$

Substituting and solving:

* $\frac{16}{80}\times{100} = r$
* $0.2\times{100} = r$
* $20 = r$

Therefore, 16 is 20% of 80.
## Find the base given the part and the ratio

16 is 20% of what base?

We know the part $p$ is 16, and that the ratio $r$ is 20. We want to find the base $b$.

The formula is:

$$
\frac{p}{r}\times{100} = b
$$

Substituting and solving:

* $\frac{16}{20}\times{100} = b$
* $0.8\times{100} = b$
* $80 = b$

Therefore, 16 is 20% of 80.

## Find out if a value is within percentage another

While trying to prevent a [reactor meltdown (see step 3)](https://exercism.org/tracks/python/exercises/meltdown-mitigation) I came across a percentage problem: I needed to know if a given number was within a certain percentage of another number.
 
For example, is $y$ within $p\%$ of $x$?

A concrete example: is $49$ within $12\%$ of $60$?

How much is $12\%$ of $60$? $\frac{12}{100} \times 60 = 0.12 \times 60 = 7.2$ , so $12\%$ of $60$ is $7.2$, which means $7.2$ is the allowed difference below and/or above $60$.

- Lower bound $60 - 7.2 = 52.8$
- Upper bound $60 + 7.2 = 72.2$

Since $49 \lt 52.8$, it means $49$ is *not* within $12\%$ of $60$.

Let $d$ be the difference, and $x$ be the original value:

```text
if x - d < x < x + d
```
