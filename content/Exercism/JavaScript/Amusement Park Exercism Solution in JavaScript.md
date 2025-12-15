---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Amusement Park Exercism challenge in Python
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/amusement-park

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

### createVisitor()

No real logic involved. Simply return an object built from the three params.

```javascript
function createVisitor(name, age, ticketId) {
  return { name, age, ticketId };
}
```

### revokeTicket()

```javascript
function revokeTicket(visitor) {
  visitor.ticketId = null;
  return visitor;
}
```

They don't want us to return a new, updated copy of the visitor object. Instead, they want us to update the same object reference. That means, something like this, even though it satisfies the expected state of the object, fails the tests due to the fact that we are returning a new object (a different reference):

```javascript
function revokeTicket(visitor) {
  return {
    ...visitor,
    ticketId: null,
  };
}
```
