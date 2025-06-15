---
tags:
  - system-design
  - payment-gateway
---
# Video and blog post by Lucian Oprea

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
## The End