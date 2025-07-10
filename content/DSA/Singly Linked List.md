---
tags:
  - dsa
  - list
  - linked-list
---
## Big O of Linked Lists

### Insertion

It doesn't matter how many nodes the list contains, given an existing node and a new node to be inserted, it takes $O(1)$ (constant time) to insert the new node. It is simply a matter of pointing a few `next` and `prev` (in the case of a doubly linked list) to the correct nodes. It doesn't requiring searching or walking the list in any way.

Given the list:

```text
NUL <- K <--> G <--> M -> NUL
```

Let's insert Z between K and G:

```text
K.next -> Z
Z.next -> G
Z.prev -> K
G.prev -> Z


NUL <- K        G <--> M -> NUL
       ^       ^
		\     / 
		 \   /
		  v v
		   Z
       

NUL <- K <--> Z <--> G <--> M -> NUL
```


## Intro to Singly Linked Lists

A Singly Linked List is a data structure which contains the properties **head**, **tail** and **length** (or other names that carry more or less the same meaning, like “first”, “root”, “last”).

It contains **nodes** (not indexes, like arrays), an each node has a **value**, or **data** and a **pointer to another node**. The pointer can be `null` if does not point to another node.

![Doubly Linked List](doubly-linked-list.png)

The name _singly linked_ comes from the fact that each node is connected unidirectionally to a single other node.

If we want the 1984th element of a singly linked list, we have to traverse from beginning to the node at that index, which has time complexity $O(n)$ (unlike arrays in which we have $O(1)$) time complexity for accessing elements).

Singly Liked Lists:

* No indexes.
* Nodes are unidirectionally connected through a `next` _pointer_.
* No random access (have to “walk the list”).
* Inexpensive insertion and deletion.

Arrays:

* Indexed in order (the indexes are in order, not the values).
* Potentially expensive insertion and deletion.
* Quick, $O(1)$ access time.

If what is really important in a given situation is fast insertion and deletion of elements (and random fast access is not important), then a linked list is a good choice.

### Operations

* Construct an empty list.
* `push(val)`: add a node at the end. T.C. $O(1)$.
* `pop()`: remove a node from the end. T.C. $O(n)$.
* `shift()`: remove a node from the beginning. T.C. $O(1)$.
* `unshift(val)`: add a node to the beginning. T.C. $O(1)$.
* `get(idx)`: Return the node at a given index. T.C. $O(n)$.
* `set(idx, val)`: Set a new node at given index and return `true`. Return `false` if node at given index doesn’t exist. T.C. $O(n)$.
* `insert(idx, val)`: Insert a node at the given index. T.C. $O(n)$.
* `remove(idx)`: Remove node at the given index. T.C. $O(n)$.
* `reverse()`: Reverse the list. T.C. $O(n)$.

## push(val)

To push a value to the singly linked list:

- Create a new node with the value passed.
- If the list is empty:
	- Add the new node as both the `head` and the `tail` of the list.
- If the list is not empty:
	- Add the new node both as the `next` pointer and head’s next pointer.
- Return.

### push(val) time complexity

No traversal is needed to push a node to a singly linked list. Head and tail are accessed and manipulated in constant time so the time complexity of `push()` is $O(1)$.

## pop()

Popping means to remove and return the last item of a list.

Observe that singly linked lists do not have a backwards pointer. There is no way to move from the end to the beginning, only from beginning to end.

To pop an element from the list we have to set a new tail, and considering the previous paragraph, we have to traverse from the beginning to find the new tail. So, to pop an item from the list, we have to find the node just before the tail, and make it become the tail.

- If the list is empty, return `undefined`.
- Loop from `head` to `tail` making sure you always have a reference to the previous node (when the loop reaches the end, this reference will be the penultimate element of the list).
- Set `next` on the penultimate node to `null` (thus deleting the current tail).
- Set the tail to be that reference to the penultimate element of the list.
- Decrement `length` by 1.
- Return the original tail element.

### pop() time complexity

Because we have to traverse the list from beginning to end, the time complexity of `pop()` is $O(n)$.

## push() and pop() initial implementation

```javascript
class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class SinglyLinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }

  push(val) {
    var node = new Node(val);

    if (this.length === 0) {
      this.head = node;
      this.tail = node;
    } else {
      //
      // !!! ORDER OF THESE STATEMENTS MATER !!!
      //
      this.tail.next = node;
      this.tail = node;
    }

    ++this.length;

    return this;
  }

  pop() {
    if (this.length === 0) return undefined;

    var cur = this.head;
    var tail = cur;

    while (cur.next) {
      tail = cur;
      cur = cur.next;
    }

    this.tail = tail;
    this.tail.next = null;

    --this.length;

    if (this.length === 0) {
      this.head = null;
      this.tail = null;
    }

    return cur;
  }
}

export { Node, SinglyLinkedList };
```

## shift()

Shifting means removing and returning the first element.

1. Return `undefined` if the list is empty.
2. Hold on to a reference to the current head in a variable.
3. Make the head next property to be the new head.
4. Decrement length by 1.
5. Return the original head stored in a variable.

### shift() time complexity

It takes constant time as the necessary nodes can be accessed directly (no traversal required).
Therefore, time complexity for `shift()` is $O(1)$.

## unshift(val)

Unshifting means adding an element to the beginning of the list.

1. Create a node with the value provided.
2. If the list is empty, assign the new node to both the head and the tail.
3. If the list is not empty, set the newly created node’s next property to the current, original head.
4. Make the newly created node the head.

### unshift(val) time complexity

It takes constant time as the necessary nodes can be accessed directly (no traversal required).
Therefore, time complexity for `unshift(val)` is $O(1)$.

## get(idx)

Returns the node at the given index.

1. If the index is less than zero or >= the length of the list, return `null`.
2. Loop until the specified index is found and return that node at that index.

### Time complexity of get(idx).

Unlike arrays, lists don’t have indexes.
It necessary to traverse the list, counting the nodes visited to reach the desired index.
Because of this, the time complexity of `get(idx)` is $O(n)$.

One possible implementation for `get(idx)` is:

```javascript
get(idx) {
  if (idx < 0 || idx >= this.length) return null;

  var cnt = 0;
  var cur = this.head;

  while (cur.next) {
    if (cnt === idx) return cur;
    cur = cur.next;
    ++cnt;
  }
}
```

Also, a more C-ish style (the while loop is different):

```javascript
var cnt = 0;
var cur = this.head;

while (cnt++ !== idx) cur = cur.next;

return cur;
```

> [!NOTE]
> It is possible that `idx` is precisely the same as the length of the list. We could do a check to see if the `idx` is the same as the list’s length and return the tail directly.

## set(idx, val)

- Takes a value and an index as parameters.
- Use already implemented `get(idx)` to find the node.
- If the node is not found, return `false`.
- If the node is found, update its value and return `true`.

It sets a new value for an existing node.
If the list is empty, and we try to set a value at index 0, it does not set any value because it is not updating an existing node.
There is no node to update.

### Time complexity of get(val, idx)

Because we have to find the element at the given index, we have to traverse the list, meaning its time complexity is $O(n)$.

## insert(idx, val)

- If index is out of the range of the list, that is, $0 \gt index \gt length$, return `false`.
- If index is same as length, it means we add to the end, just like `push(val)`.
- If index is 0, it is the same as `unshift(val)`.
- If none of the above, find the node by using `get(idx - 1)`.
	- Set the node’s `next` property to be the new node.
	- Set the new node `next` property to be the old `next`.
- Increment the length.
- Return true.

## remove(idx)

- If index is out of the range of the list, that is, $0 \gt index \gt length$, return `undefined`.
- If index $length - 1$, `pop()`.
- If index is 0, `shift()`.
- Otherwise:
	- Let `prev` be `get(idx - 1)`.
	- Let `prev.next` to be be `next` of the next node.
	- Decrement length.
	- Return the value of the node removed.

### Time complexity

Because we potentially have to traverse the list, the time complexity of `remove(idx)` is $O(n)$.

## reverse()

We need to have the prev, curr and next nodes!

- Swap head and tail.
- Let `prev` be `null`, `node` be the original head, `next` be `undefined`.
- Loop:
	- Set `next` to be `node.next`.
	- Set `node.next` to be `prev` (this is the node connection that actually reverses the list).
	- Set `prev` to be `node`.
	- Set `node` to be `next`.
- Return the list (`this` if doing OO).

## JavaScript Implementation

```javascript
class Node {
  /**
   * Creates a node.
   *
   * @param {unknown} val
   */
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class SinglyLinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }

  push(val) {
    var node = new Node(val);

    if (this.length === 0) {
      this.head = node;
      this.tail = node;
    } else {
      //
      // !!! ORDER OF THESE STATEMENTS MATER !!!
      //
      this.tail.next = node;
      this.tail = node;
    }

    ++this.length;

    return this;
  }

  pop() {
    if (this.length === 0) return undefined;

    var cur = this.head;
    var tail = cur;

    while (cur.next) {
      tail = cur;
      cur = cur.next;
    }

    this.tail = tail;
    this.tail.next = null;

    --this.length;

    if (this.length === 0) {
      this.head = null;
      this.tail = null;
    }

    return cur;
  }

  shift() {
    if (this.length === 0) return undefined;

    var shifted = this.head;
    this.head = this.head.next;

    --this.length;

    if (this.length === 0) this.tail = null;

    return shifted;
  }

  unshift(val) {
    var node = new Node(val);

    if (this.length === 0) this.tail = node;
    else node.next = this.head;

    this.head = node;

    ++this.length;
  }

  get(idx) {
    if (idx < 0 || idx >= this.length) return null;

    var cnt = 0;
    var cur = this.head;

    while (cnt++ !== idx) cur = cur.next;

    return cur;
  }

  set(idx, val) {
    var node = this.get(idx);
    if (node === null) return false;

    node.val = val;
    return true;
  }

  insert(idx, val) {
    if (idx < 0 || idx > this.length) return false;

    else if (idx === this.length) this.push(val);
    else if (idx === 0) this.unshift(val);

    else {
      var node = new Node(val);
      var prev = this.get(idx - 1);

      node.next = prev.next;
      prev.next = node;

      ++this.length;
    }

    return true;
  }

  remove(idx) {
    if (idx < 0 || idx >= this.length) return undefined;

    if (idx === 0) return this.shift();
    if (idx === this.length - 1) return this.pop();

    var prev = this.get(idx - 1);
    var removed = prev.next;

    prev.next = removed.next
    --this.length;

    return removed;
  }
}

export { Node, SinglyLinkedList };
```
