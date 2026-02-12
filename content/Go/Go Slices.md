---
tags:
  - go
  - slice
  - collection
  - data-structure
description: Notes, tips and examples on Go slices.
---
## Intro

Unlike arrays, slices do not encode the length as part of the type. Only the elements are part of the type.

An empty slice is the same as `nil` and has the length of 0 (zero):

``` go
var s []string

fmt.Printf("%T", s)
//=> []string

fmt.Println(s == nil)
//=> true

fmt.Println(len(s))
//=> 0
```

It is possible to use `make(type, initialLength)` to create slices of an initial specific storage capacity. A slice’s capacity is the same as its initial length:

``` go
var s []string = make([]string, 3)
fmt.Print(len(s))
//=> 3
```

Printing with `fmt.Println()`:

``` go
fmt.Println(s)
//=> [  ]
```

It prints two spaces inside the square brackets, that is, two 0x0020 chars.

And let’s inspect that with `od`:

``` go
$ go run ./gobyexample/scratch.go | od -cax
0000000   [           ]  \n
          [  sp  sp   ]  nl
           205b    5d20    000a
0000005
```

Why two spaces? Because it is three zero-valued values separated by spaces. It prints separated by spaces like Lisp lists which contains space-separated elements (instead of comma-separated elements). Why Go decided to require commas to create such collections, but by default prints those collections with those elements separated by spaces is a mystery that remains to be solved.

Empty strings are the zero-value of strings, which is not easy to see. Compare with a slice of size 3 for ints:

``` go
var xs []int = make([]int, 3)
fmt.Println(xs)
//=> [0 0 0]
```

Three zero-valued values (for ints this time) separated by two spaces.

We can make use of `fmt`’s `#v` formatting verb to display values in Go-like syntax:

``` go
var s []string = make([]string, 3)
fmt.Printf("%#v\n", s)
//=> []string{"", "", ""}

var xs []int = make([]int, 3)
fmt.Printf("%#v\n", xs)
//=> []int{0, 0, 0}
```

## Operations on slices

### len()

``` go
var xs []int = make([]int, 3)
fmt.Println(len(xs))
//=> 3
```

### append()

It is also possible to add one or more elements to the end of a slice and return a new slice with all the elements put together:

``` go
var xs = []int{1, 2, 3}
var ys = append(xs, 4, 5, 6)
fmt.Printf("%#v\n", ys)
//=> []int{1, 2, 3, 4, 5, 6}
```

Even though it says *append*, it does not really append to the existing slice, but instead returns a new slice without touching the existing slice, which still contains its original elements.

### copy()

It is also possible to copy a slice:

``` go
var xs = []int{1, 2, 3}
var ys = make([]int, len(xs))

copy(ys, xs)

fmt.Printf("%#v\n", ys)
//=> []int{1, 2, 3}
```

### slice operator ‘ini:end’

Using the `[ini:end]` syntax, it is possible to retrieve a slice from index `ini` up to, but not including, index `end`:

``` go
var xs = []int{1, 2, 3, 4, 5}
ys := xs[1:4]
fmt.Println(ys)
//=> [2 3 4]
```

Either side of the slice can be omitted.

Selects from index 2 to the end:

``` go
var xs = []int{1, 2, 3, 4, 5}
ys := xs[2:]
fmt.Println(ys)
//=> [3 4 5]
```

Select from index zero up to, but not including index 3:

``` go
var xs = []int{1, 2, 3, 4, 5}
ys := xs[:3]
fmt.Println(ys)
//=> [1 2 3]
```

## Multi-dimensional slices

Unlike arrays, inner slices do not need to be all of the same length:

``` go
var twoD = [][]int{{1}, {2, 3}, {4, 5, 6}}

fmt.Println(twoD)
//=> [[1] [2 3] [4 5 6]]

fmt.Printf("%#v\n", twoD)
//=> [][]int{[]int{1}, []int{2, 3}, []int{4, 5, 6}}
```

Or creating it dynamically with loops:

``` go
var twoD = make([][]int, 3)

for i := 0; i < 3; i++ {
  innerLen := i + 1
  twoD[i] = make([]int, innerLen)

  for j := 0; j < innerLen; j++ {
    twoD[i][j] = i + j
  }
}

fmt.Println(twoD)
// => [[0] [1 2] [2 3 4]]

fmt.Printf("%#v\n", twoD)
// => [][]int{[]int{0}, []int{1, 2}, []int{2, 3, 4}}
```

## References

- <https://go.dev/blog/slices-intro>
- <https://gobyexample.com/slices>
- <https://pkg.go.dev/slices>
- <https://go.dev/wiki/SliceTricks>
- <https://go.dev/tour/moretypes/6>