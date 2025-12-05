---
tags:
  - math
  - percentage
  - percent
description: Notes and examples on common, useful percentage problems and situations
---
# Percentages | Math

## Introduction

In these examples we will use:

* $p$ to represent the percent.
* $b$ to represent the base or quantity.
* $n$ to represent the percentage.

## Add or subtract p% of a quantity

Suppose something costs 80 (whatever currency). How could we add 12% extra fee on top of that amount? Or how could we give a discount of 12% on that amount?

Remember that if we multiply a number by 1 we are getting 100% of that number, so, $80 \times 1 = 80$. So 1 is 100%. And 12% is 0.12.

To add 12% to 80, we multiply 80 by $1 + 0.12$:

$$80 \times (1 + 0.12) = 89.6$$

To subtract 12% from 80, multiply 80 by $1 - 0.12$:

$$80 \times (1 - 0.12) = 70.4$$

$1 + 0.12$ can be thought of 100% of a number plus 12% of that number. 100 % of 80 is 80, and 12% of 80 is 9.6, therefore, 100% of 80 plus 12% of 80 is 80 + 96, which is 89.6.

Similarly, $1 - 0.12$ can be thought of 100% a number minus 12% of that number. 100% of 80 is 80 and -12% of 80 is -9.6, therefore, 100% of 80 minus -12% of 80 is 80 - 9.6, which is  70.4.

## Find percentage of a quantity

### Example 1

What is 25% of 60? We know 25 the percent $p$, 60 is the base $b$, and we want to find the percentage $n$.

Then, the formula is:

$$
\frac{n}{100} \times b = p
$$

Substituting and solving:

* $\frac{25}{100}\times{60}=p$
* $0.25\times{60}=p$
* $15=p$

Therefore, 25% of 60 is 15, or 15 is 25% of 60.

## Find the percent or ratio

### Example 1

15 is what percent of 60?

We know that the percentage $n$ is 15, and that the base or quantity $b$ is 60.
We want to find percent $p$.

Then, the formula is:

$$
\frac{n}{b}\times{100} = p
$$

Substituting and solving:

* $\frac{15}{60}\times{100} = p$
* $0.25\times{100} = p$
* $25 = p$

Therefore, 15 is 25% of 60.

## Find the quantity from a percentage and percent

15 is 25% of what quantity?

We know the percentage $n$ is 15, and that the percent $p$ is 25. We want to find the base (or quantity) $b$.

The formula is:

$$
\frac{n}{p}\times{100} = b
$$

Substituting and solving:

* $\frac{15}{25}\times{100} = b$
* $0.6\times{100} = b$
* $60 = b$

Therefore, 15 is 25% of 60.

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
