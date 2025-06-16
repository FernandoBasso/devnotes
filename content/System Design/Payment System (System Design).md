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

### Handling transient errors/faults

Linear or exponential back-off retries.

Exponential back-off retry function: $f(x) = 2^x$, where $x$ represents the retry.

- Retry 1 after 2 seconds: $f(1) = 2^1$
- Retry 2 after 4 seconds: $f(2) = 2^2$
- Retry 3 after 8 seconds: $f(3) = 2^3$
- Retry 4 after 16 seconds: $f(4) = 2^4$

We don't want clients hammering a service already facing issues and contribute even more to the problem.
See [Retry Strategy](Retry%20Strategy.md).

Add an element of randomness if two or more clients are accessing the same problematic service so they don't perform the request at the exact same time.

### Timeout pattern
If an outbound request doesn't complete by the service within X time, abort.


### Fallback

If payment would fail because fraud-check service is down, instead of losing the sale and the customer, we apply a business rule like “if the order is <= $ 100, go ahead and accept the risk and complete the order”. It is a compromise already decided at the business level.

### Handling persistent (non-transient) failures

Failures that could last for minutes to days.

If data sent by sender is not compatible with what the receiver wants, retrying will simply result in the same error. These are known as poison-pill errors. Save those messages into a dead-letter queue for later inspection.

If a service we need is down, store the message in a persistent queue so it can be retried later when the service is back working fine.

### Idempotency

implement idempotent operations to avoid charging the user multiple times, sending the same comms multiple times, etc.

Idempotency key (usually an UUID).
Generated at the client and expires after a certain amount of time.
Sent in HTTP headers.

The PSP can make use of the unique constraint on relation DBs to enforce that the payment is not duplicated.

Idempotency in this case ensures _exactly once_ guarantee.

```
$ echo hello
$ exit 0
```

## The End