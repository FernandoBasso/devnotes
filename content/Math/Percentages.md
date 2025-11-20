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

## Find percentage of a quantity

### Example 1

What is 25% of 60? We know 25 the percent $p$, 60 is the base $b$, and we want to find the percentage $n$.

Then, the formula is:

$$
\frac{n}{100} \times {x} = p
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

I came across a situation where I needed to figure out if a number was within a certain percentage of another number while trying to prevent a [reactor meltdown (see step 3)](https://exercism.org/tracks/python/exercises/meltdown-mitigation):

For example, is $y$ within $p\%$ of $x$?

A concrete example: is $49$ within $12\%$ of $60$?

How much is $12\%$ of $60$? $\frac{12}{100} \times 60 = 0.12 \times 60 = 7.2$ , so $12\%$ of $60$ is $7.2$, which means $7.2$ is the allowed difference below and/or above $60$.

Let $d = \frac{12}{100} \times 60$. Therefore, $d = 7.2$ as already seen.

- $lower = 60 - 7.2 = 52.8$
- $upper = 60 + 7.2 = 72.2$

Since $49 \lt 52.8$, it means $49$ is *not* within $12\%$ of $60$.
