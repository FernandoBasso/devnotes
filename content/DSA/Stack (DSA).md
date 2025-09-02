---
tags:
  - dsa
  - stack
description: Concepts, explanations and practical code examples about the stack data structure.
---

## Intro

> [!INFO] Slides
>
> [My stack slides on Google Docs](https://docs.google.com/presentation/d/1r-Ktl8b3KYatBVAXjVEk-Z413SMsPIjoBH8Mth4x4q4)

Stack is a concept. Last in, first out (LIFO). Contrast stacks with queues, with are first in, first out (FIFO).

The *insert* operation is generally known as *push*, and the *delete* operation is known as _pop_.

Can be implemented with array `push()` and `pop()` (or similar methods/functions, depending on the programming language).

Yet, as we need only order but not indexes for stacks, it is possible to implement a stack using a a singly or doubly linked list, especially if the programming language we are implement the stack in does not support dynamic arrays (which can grow on demand, vs in languages where we have to define the size of the array before hand).

Insertion `push(val)` and removal `pop()` in a stack should have $(O(1)$ time complexity.

Search and access is $O(n)$ but if searching and getting values from a stack is what is needed, then consider some other data structure, as stack are meant to have fast $O(1)$ time complexity on its standard operations. If searching and getting from the “middle” is needed, consider using some other data structure instead.

## Using linked lists

We can implement stack with linked lists and a node with a `next` property, or with a `prev` property. In these next examples, let's use `prev` (instead of `next`). The idea is that a new node added will become the new “top” element, and its `prev` property points to the node that was the “top” element just before the new “top” was pushed to the stack.

### Value container

Internally, we'll use a container to store the value and the pointer to the previous item on the stack:

```typescript
type Node<T> = {
  value: T | null;
  prev: Node<T> | null;
};
```

This `Node` example is a recursive data structure as `prev` points to `Node<T>`.
### Constructor

The constructor is generic over a given type `T` and creates an empty stack.

```typescript
const stack = new Stack<string>();
```

If desirable, the constructor could be implemented to accept a variadic number of arguments or a collection and create a non-empty stack, maintaining the order of the passed-in arguments.

### push(val): void

![Stack (DSA) push(val) using linked lists](stack-push-val-linked-list.png)

Push inserts a value to the top of the stack and returns void.

1. Let `node` be a new node constructed from the value passed.
2. Then, if the stack is empty:
	1. Point `top` to `node`.
3. Otherwise, if the stack is not empty:
	1. Point `node.prev` to the current `top`.
	2. Point `top` to `node` so `node` becomes the new `top`.
4. Increment `size` by 1.
5. Return void.

**Time complexity**: $O(1)$.

### pop(): T | null

1. If  `top` is `null`, then return `null`.
2. Let `currentTop` be a reference to `top`.
3. Point `top` to `top.prev` to make `top.prev` become the new `top`.
4. Decrement `size` by 1.
5. Return `currentTop.value`.

**Time complexity**: $O(1)$.

### size(): int

`size()` returns an integer indicating how many elements are in the stack. Returns 0 (zero) if the stack is empty.

**Time complexity**: $O(1)$. We can keep an internal counter that gets updated when elements are pushed or popped from the stack. This way, when the `size()` is requested, there is no need to walk the stack and count how many elements it contains. We can simply return the value of this internal counter.

### isEmpty(): bool

Returns a boolean indicating whether the stack is empty or not. The stack is empty if its `top` is `null` or its internal length/size counter is 0 (zero).

**Time complexity**: $O(1)$.

## Using arrays
### push(val)

Time complexity: $O(1)$.

- let `newNode` to be a new node.
- If the stack is empty:
	- Set `first` and `last` to be the new node.
- If the stack is not empty:
	- Save a reference `oldFirst` to the current `first`.
	- Set the new node as `first`.
	- Set `newNode.next` to `oldFirst`.
- Increment `size` by 1.
- Return `size`.

> [!NOTE]
>  `push(val)` returns the new size, while `pop()` returns the node.

### pop()

Time complexity: $O(1)$.

- If the stack is empty, return `null`.
- Let `oldTop` be a reference to the current top.
- If there is one node:
	- Set `top` to `null`.
- If there are two or more nodes:
	- Set `top` to be `oldTop.prev`.
	- Set `oldTop.prev` to `null`.
- Decrement size.
- Return `oldTop`.

> [!NOTE]
> `pop()` returns the node, while `push(val)` returns the new size.


### JavaScript using arrays

```javascript
class Node {
  constructor(val) {
    this.val = val;

    //
    // I'll call it prev because “the top points to the previous node”
    // (except for the empty or single- element stack).
    //
    this.prev = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.size = 0;
  }

  push(val) {
    var newNode = new Node(val);

    if (this.size === 0) {
      this.top = newNode;
    } else {
      var oldTop = this.top;
      this.top = newNode;
      newNode.prev = oldTop;
    }

    return ++this.size;
  }

  pop() {
    if (this.size === 0) return null;

    var oldTop = this.top;

    if (this.size === 1)
      this.top = null;
    else
      this.top = oldTop.prev;

    --this.size;

    oldTop.prev = null;

    return oldTop;
  }
}
```
