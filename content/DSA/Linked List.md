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
