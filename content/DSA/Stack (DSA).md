---
tags:
  - dsa
  - stack
description: Concepts, explanations and practical code examples about the stack data structure.
---

## Intro

Stack is a concept. Last in, first out (LIFO).

Can be implemented with array `push()` and `pop()` (or similar methods/functions, depending on the programming language).

Yet, as we need only order but not indexes for stacks, we are probably better of by making use a a singly or doubly linked list.

Insertion `push(val)` and removal `pop()` in a stack should have $(O(1)$ time complexity.

Search and access is $O(n)$ but if searching and getting values from a stack is what is needed, then consider some other data structure.

## push(val)

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

