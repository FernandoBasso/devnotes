---
tags:
  - go
  - for
  - loop
  - while
  - range
---

## Infinite loop

### JavaScript while and do while

```javascript
while (1) {
  // Loop forever.
}

while (true) {
  // Loop forever.
}

do {
  // Loop forever.
} while (1);

do {
  // Loop forever.
} while (1);
```

### Go



## do while

In JavaScript:

```javascript
do {
  // ...
} while (x < y);
```

In Go:

```go
for {
  if !(x < y) {
    break // Or return something.
  }

  // ...
}
```

Or:

```go
for {
  if x >= y {
    break // Or return something.
  }

  // ...
}
```

Or with a so-called _loop condition_:

```go
for lo < hi {
  // ...
}
```
