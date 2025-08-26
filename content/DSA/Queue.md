---
tags:
  - dsa
  - queue
---
## Intro to Queues

Queues are a linked list behind the scenes, but it restricts what can be done with it _on purpose_ to guarantee constant time complexity for its operations, which are generally these:

- enqueue
- dequeue
- peek 

## enqueue(val)

### To an empty queue

- Let `newNode` be a new node constructed with `val`.
- Make `head` point to the `newNode`.
- Make `tail` point to the `newNode`.
- Increment `length`.

Note that in this case, both `head` and `tail` point to the new node, as the queue was previously empty.

### To a non-empty queue

- Let `newNode` be a new node constructed with `val`.
- Point `tail.next` to the `newNode`.
- Increment `length`.

Note that the algorithm works whether the queue contains a single element (in which case both `head` and `tail` point to the same element), or it contains more than one element (in which case `head` and `tail` _do not_ point to the same element). It works in both cases because the algorithm only has to concern itself with fiddling with the `tail`. The `head` remains untouched.