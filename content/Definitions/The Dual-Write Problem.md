---
tags:
  - definition
  - system-design
  - dual-write
  - transactional-outbox-pattern
---
## Intro

When a process needs to write to two (or more) separate other systems and it is not possible to do it in a single transaction, it could happen that the write is performed in one of those systems, and not the other.

![The dual-write problem](dual-write-problem.png)

In this example, the microservice could write to the database and fail enqueue a message in Kafka, or enqueue a message in Kafka and fail do save to the database.

The [Transactional Outbox Pattern](Transactional%20Outbox%20Pattern.md) can be used to mitigate this problem.
