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

With a recursive function:

```javascript
(function f(b) {
  f(b);
}(1));

// $ node main.js 
// (function f(b) {
//            ^
// 
// RangeError: Maximum call stack size exceeded
```

Not really infinite loop, but it loops as long as the JavaScript engine allows the function to be recursively called.
### Go

```go
for {
  // Loop forever.
}
```

With recursive function invocation:

```go
func f(i int8) {
  f(i)
}

func main() {
  f(1)
}
```

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
