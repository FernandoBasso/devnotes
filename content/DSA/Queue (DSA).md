---
tags:
  - dsa
  - queue
description: Concepts, explanations and practical code examples about the queue data structure.
---
## Intro to Queues

Queues are a linked list behind the scenes, but it restricts what can be done with it _on purpose_ to guarantee constant time complexity for its operations, which are generally these:

- enqueue
- dequeue
- peek 

The space complexity of a queue is $O(n)$.

All the operations have $O(1)$ time complexity if the queue is implemented using linked lists. If the queue is implemented using arrays, then some operation may have $O(n)$ time complexity. If for example, the head is returned and removed using an operation like `shift()` in JavaScript,o which causes all the elements to be moved “to the left” by one index, which also means that operation is $O(n)$ time complexity.
## enqueue(val)

The enqueue operation appends a new value to the end of the queue and increases the queue length by 1.

### To an empty queue

- Let `newNode` be a new node constructed with `val`.
- Make `head` point to `newNode`.
- Make `tail` point to `newNode`.
- Increment `length`.

Note that in this case, both `head` and `tail` point to the new node, as the queue was previously empty.

### To a non-empty queue

- Let `newNode` be a new node constructed with `val`.
- Point `tail.next` to `newNode`.
- Point `tail` to `newNode`.
- Increment `length`.

Note that the algorithm for enqueuing to a non-empty queue works whether the queue contains a single element (in which case both `head` and `tail` point to the same element), or it contains more than one element (in which case `head` and `tail` _do not_ point to the same element). It works in both cases because the algorithm only has to concern itself with fiddling with the `tail`. The `head` remains untouched.

### dequeue()

The dequeue operation returns the head value, makes the next element become the new head, and decrease the queue length by 1.

- If the queue is empty (`length` is 0, no `head`) return `null`.
- Increment `length` by 1.
- Let `headToReturn` be the current `head`.
- Point  `head` to `head.next`
- Return `headToReturn.value`.
