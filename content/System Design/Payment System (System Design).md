---
tags:
  - system-design
  - payment
---

## Main topics for a payment system

- How a payment system works?
- Scope the problem
- Functional and  Non-Functional Requirements
- Payment System Components
- Asynchronous Payments
- Dealing with Payment Failures
- Guarantee transaction completion
- Dealing with Transient Failures
- Timeout Pattern
- Fallbacks
- Dealing with Persistent Failures
- Idempotency (Avoid double payments)
- Making use of Distributed Systems
- Encryption for Data-at-Rest and Data-in-Transit
- Data Integrity Monitoring 

## Video and blog post by Lucian Oprea

Design a Payment System, by High-Performance Programming (Lucian Oprea):
- https://www.youtube.com/watch?v=olfaBgJrUBI:
- https://lucianoprea.com/blog/payment-system-design


- PSP: Payment Service Provider.
- PCI DSS: Payment Card Industry Data Security Standard.
- AML: Anti-Money Laundering.
- KYC: Know Your Customer (check customer identity/status from time to time).


**Non-retryable errors**:
Suppose the error was due to the fact that the data sent was not compatible with what the receiver expected?
If we retry and resend the same data, we'll simply have the same response.
This is an example of a non-retryable error.

These **incompatible messages** are also known as **poison pill errors**.

Save those in a DLQ for debugging later.

## Handling transient errors/faults

Linear or exponential back-off retries.

Exponential back-off retry function: $f(x) = 2^x$, where $x$ represents the retry.

- Retry 1 after 2 seconds: $f(1) = 2^1$
- Retry 2 after 4 seconds: $f(2) = 2^2$
- Retry 3 after 8 seconds: $f(3) = 2^3$
- Retry 4 after 16 seconds: $f(4) = 2^4$

## The End