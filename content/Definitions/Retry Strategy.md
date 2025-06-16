---
tags:
  - definition
  - retry
  - strategy
---
## Intro

When some operation fails and can or should be retried, there are a few strategies one could attempt:

- Immediately.
- Fixed intervals.
- Exponential back-off.

> [!WARNING]
> For certain situations, it is important that retries are implemented with [Idempotence](Idempotence.md) in mind to avoid processing the same operation more than once.
> For example, we don't want to retry a payment just to have an user charged twice.
### Exponential back-off function

Exponential back-off retry function: $f(x) = 2^x$, where $x$ represents the retry (first retry, second retry, third, etc.).

- Retry 1 after 2 seconds: $f(1) = 2^1$
- Retry 2 after 4 seconds: $f(2) = 2^2$
- Retry 3 after 8 seconds: $f(3) = 2^3$
- Retry 4 after 16 seconds: $f(4) = 2^4$

We don't want clients hammering a service already facing issues and contribute even more to the problem.

