---
tags:
  - go
  - for
  - loop
  - while
  - range
---
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
