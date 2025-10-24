---
tags:
  - dsa
  - queue
description: Concepts, explanations and practical code examples about the queue data structure.
---
## Intro to Queues

Queues can be implemented using arrays, but are more efficiently implemented using linked lists. For the rest of this document assume the implementation uses a linked list unless otherwise noted.

The implementation restricts what can be done with the data structure _on purpose_ to guarantee constant time complexity for its operations, which are generally these:

- enqueue: add an element to the end (tail).
- dequeue: return and remove the element in the front of the queue (head).
- peek: return the first element (head) without modifying the queue in any way.

The space complexity of a queue is $O(n)$.

All the operations have $O(1)$ time complexity if the queue is implemented using linked lists. If the queue is implemented using arrays, then some operations may have $O(n)$ time complexity due to the nature of arrays and its operations. If for example, the head is returned and removed using an operation like `shift()` in JavaScript, which causes all the elements to be moved “to the left” by one index, which also means that operation is $O(n)$ time complexity.

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

## enqueue(val): void

The enqueue operation appends a new value to the end of the (side of the queue which contains the tail) queue and increases the queue length by 1.

### To an empty queue

First of all, how do we determine whether the queue is empty?
- If `length` is 0 (zero).
- If either `head` or `tail` is `null`.

Steps:
- Increment `length`.
- Let `newNode` be a new node constructed with `val`.
- Make `head` point to `newNode`.
- Make `tail` point to `newNode`.

Note that in this case, both `head` and `tail` point to the new node, as the queue was previously empty.

### To a non-empty queue

- Increment `length`.
- Let `newNode` be a new node constructed with `val`.
- Point `tail.next` to `newNode`.
- Point `tail` to `newNode`.

Note that the algorithm for enqueuing to a non-empty queue works whether the queue contains a single element (in which case both `head` and `tail` point to the same element), or it contains more than one element (in which case `head` and `tail` _do not_ point to the same element). It works in both cases because the algorithm only has to concern itself with fiddling with the `tail`. The `head` remains untouched.

Also, note that we point `newNode` to both `tail.next` **and** `tail`. That is because `tail.next` points to `null`, and now we are adding a new node to the end, so `tail.next` has to point to that new node. Then of course, the current tail is not the tail any longer, but the new node has to become the new tail, which is why `tail` has to now point to `newNode`.

## dequeue(): T | null

The dequeue operation returns the `head` value, makes the `head.next` become the new `head`, and decrease the queue length by 1.

- Return `null` if the queue is empty (`length` is 0, no `head`).
- Decrement `length` by 1.
- Let `headToReturn` be the current `head`.
- Point  `head` to `head.next`
- Return `headToReturn.value`.

## peek(): T | null

The peek operation just returns the head value (if any), but it does not modify the queue in any way.

## TypeScript implementation

```typescript title="Queue implementation in TypeScript"
export type QNode<T> = {
  val: T;
  next: QNode<T> | null;
};

export class Queue<T> {
  #head: QNode<T> | null;
  #tail: QNode<T> | null;
  length: number = 0;

  constructor() {
    this.#head = null;
    this.#tail = null;
    this.length = 0;
  }

  enqueue(val: T) {
    const node: QNode<T> = { val, next: null };
    ++this.length;

    if (this.#tail === null) {
      this.#head = this.#tail = node;
      return;
    }

    this.#tail.next = node;
    this.#tail = node;
  }

  dequeue(): T | null {
    if (this.#head === null)
      return null;

    --this.length;

    const headToReturn = this.#head;

    this.#head = this.#head.next;

    return headToReturn.val;
  }

  peek(): T | null {
    if (this.#head === null)
      return null;

    return this.#head.val;
  }
}
```

