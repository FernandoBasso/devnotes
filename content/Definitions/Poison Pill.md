---
tags:
  - definition
  - system-design
  - poison-pill
---
## Intro

A _poison pill_ is a record, piece of data or message that _always_ fails to be consumed because it is corrupt, mal-formed, or otherwise invalid for the system trying to process it.
The writer (producer) schema is not compatible with the reader (consumer) schema.

It causes a non-retryable error.
No matter how many times the data is sent (or fetched) for processing, it will always fail.

## Resources

- https://javierholguera.com/2018/08/12/poison-pills-in-kafka-i/

