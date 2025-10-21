---
tags:
  - dsa
  - queue
description: Concepts, explanations and practical code examples about the queue data structure.
---
## Intro to Queues

Queues are a linked list behind the scenes, but it restricts what can be done with it _on purpose_ to guarantee constant time complexity for its operations, which are generally these:

- enqueue: add an element to the end (tail).
- dequeue: return and remove the element in the front of the queue (head).
- peek: return the first element (head) without modifying the queue in any way.

The space complexity of a queue is $O(n)$.

All the operations have $O(1)$ time complexity if the queue is implemented using linked lists. If the queue is implemented using arrays, then some operations may have $O(n)$ time complexity. If for example, the head is returned and removed using an operation like `shift()` in JavaScript, which causes all the elements to be moved “to the left” by one index, which also means that operation is $O(n)$ time complexity.

## Queue with linked lists

To implement a queue with a linked list, we need a container type which contains at least the value and the pointer to the next item of the queue, if any:

```typescript title="QNode in TypeScript"
type QNode<T> = {
  val: T;
  next: QNode<T> | null;
};
```

Note that `next` points to `QNode<T>`, making the type definition recursive.

We also need a way to keep the `head`, `tail` and the `length` of the queue. Let's start with this:

```typescript title="Queue class in TypeScript"
class Queue<T> {
  #head: QNode<T> | null;
  #tail: QNode<T> | null;
  length: number = 0;

  constructor() {
    this.#head = null;
    this.#tail = null;
    this.length = 0;
  }
}
```

## enqueue(val)

The enqueue operation appends a new value to the end of the (side of the queue which contains the tail) queue and increases the queue length by 1.

### To an empty queue

First of all, how do we determine whether the queue is empty?
- If `length` is 0 (zero).
- If either `head` or `tail` is `null`.

Steps:
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

## dequeue()

The dequeue operation returns the head value, makes the next element become the new head, and decrease the queue length by 1.

- If the queue is empty (`length` is 0, no `head`) return `null`.
- Increment `length` by 1.
- Let `headToReturn` be the current `head`.
- Point  `head` to `head.next`
- Return `headToReturn.value`.
