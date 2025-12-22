---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the Amusement Park Exercism challenge in JavaScript
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

### ticketStatus()

Check if the ticket ID exists in our tickets DB. If not, return the unknown ticket ID message and be done with it. If that is not the case, there *is* a ticket with that ID. So we just handle the case when it is sold or not.

```javascript
function ticketStatus(tickets, ticketId) {
  if (!(ticketId in tickets))
    return "unknown ticket id";

  return tickets[ticketId] !== null
    ? "sold to " + tickets[ticketId]
    : "not sold";
}
```

The approach shown above is not so hard to understand, but not as common as we would like it to be. Most of the time, people would solve similar problems nesting conditionals like this:

```javascript
function ticketStatus(tickets, ticketId) {
  if (ticketId in tickets)
    if (tickets[ticketId] !== null)
      return "sold to " + tickets[ticketId];
    else
      return "not sold";

  return "unknown ticket id";
}
```

In general, the less nesting, the better. Almost always, the better, more elegant, and most importantly, *readable* approach is to handle unhappy and error scenarios earlier and do early returns instead of deeply nesting conditionals and loops.

### simpleTicketStatus()

There are some tickets with whose "name" are values like the empty string "" or 0 (zero), which are falsey in ECMAscript. But remember that the nullish coalescing operator only considers `null` and `undefined` as nullish and falsey, thus, this is enough to satisfy the requirements for this function:

```javascript
function simpleTicketStatus(tickets, ticketId) {
  return tickets[ticketId] ?? "invalid ticket !!!";
}
```


### gtcVersion()

The goal for this one is to use the optional chaining operator `?.`.

```javascript
function gtcVersion(visitor) {
  return visitor.gtc?.version;
}
```

Before `?.` existed in ECMAScript, the same outcome was possible with the guard operator approach, albeit a bit more verbose:

```javascript
function gtcVersion(visitor) {
  return visitor.gtc && visitor.gtc.version;
}
```
