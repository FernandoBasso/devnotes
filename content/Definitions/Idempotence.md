---
tags:
  - definition
  - idempotence
---
## Intro

> Idempotence is the property of certain operations in mathematics and computer science whereby they can be applied multiple times without changing the result beyond the initial application.
> 
> — Wikipedia


Another way to put it is to say that:

> An idempotent operation has no additional effect if it is called more than once with the same input parameters.
## Examples

### DELETE /posts/1

Imagine an HTTP request like this:

```text
DELETE /posts/1
```

If that request is successful, issuing that same request again will not change the state of the system.
If the post was deleted, that post doesn't exist any longer in the system and performing that request again will not change anything in the system in question.

## Resources

- https://en.wikipedia.org/wiki/Idempotence
- https://dictionary.cambridge.org/dictionary/english/idempotent