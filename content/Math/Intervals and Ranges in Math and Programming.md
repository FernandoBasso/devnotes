---
tags:
  - math
  - interval
  - programming-language
---
## Intro to intervals and ranges

In Math, we have the concept of closed and open intervals. It can be closed or open on both sides or a mix of closed on one side and open on the other side.

- **Closed**: the value _is_ included.
- **Open**: the value is _not_ included.

The symbol for the open interval is the left parenthesis “(” if the interval is open on the left, and the right parenthesis “)” if the interval is open on the right.

The symbol for the closed interval is the left square bracket ”\[” if the interval is closed on the left, and the right square bracket if the interval is closed on the right.

With LaTex notation we use something these:

- $\mathopen{[}$ if the interval is closed on the left.
- $\mathclose{]}$ if the interval is closed on the right.
- $\mathopen{(}$ if the interval is open on the left.
- $\mathclose{)}$ if the interval is closed on the right.

```latex
\mathopen{[}$
\mathclose{]}
\mathopen{(}$
\mathclose{)}
```

### Example 1

The interval is closed on both sides so it means 1 and 4 are included:
$$
\mathopen{[}1, 2, 3, 4\mathclose{]}
$$

If someone asks us to sum the integers in that interval, we would include both 1 and 4 in the sum:

$$
1 + 2 + 3 + 4 = 10
$$

## Examples

Let's illustrate with a few simple examples with an interval of integers from 1 to 4 and sum those integers with the possible combination of open and close states on each side.
### Example 2

The interval is open on both sides, so neither 1 nor 4 are included:

$$
\mathopen{(}1, 2, 3, 4\mathclose{)}
$$
If someone asked us to sum the integers in that interval, we would not include 1 and 4 in the sum:

$$
2 + 3 = 5
$$

### Example 3

The interval is closed on the left and open on the right. We include 1 but not 4:
 $$
\mathopen{[}1, 2, 3, 4\mathclose{)}
$$

If someone asked us to sum the integers in that interval, we would include 1 in the sum, but not 4:

$$
1 + 2 + 3 = 6
$$

### Example 4

The interval is open on the left and closed on the right. We do not include 1, but include 4:
 $$
\mathopen{(}1, 2, 3, 4\mathclose{]}
$$

If someone asked us to sum the integers in that interval, we would not include 1 in the sum, but would 4:

$$
2 + 3 + 4 = 9
$$

### for loop in programming languages

In programming languages, the closed and open nature of the intervals is commonly seen in for loops. Given a collection (like an array) of length $n$, we sum from 0 up to, but not including $n$.

Let's examine a simple JavaScript program to sum from 1 to 4.

```javascript
var log = console.log.bind(console);

var xs = [10, 20, 30, 40];
//        0   1   2   3   <-- array index

log(xs.length);
//=> 4

var sum = 0;

for (var i = 0; i < xs.length; ++i)
  sum = sum + xs[i];

log(sum);
//=> 100
```

Note that `xs.length` is `4`, but we loop up to `< 4`. That is because an array of length 4 has elements at indexes 0, 1, 2, 3. If we looped up to `<= 4`, we would fall into the _off-by-one error_.

So in this case, even though our array is `[10, 20, 30, 40]`, we loop from `0`, up to but not including `xs.length`. We could write the array indexes interval like this:

$$
\mathopen{[}i_{0}, i_{1}, i_{2}, ..., i_{n}\mathclose{)}
$$
Where $i$ represents an index position and $n$ represents the array length. Note that the interval is closed on the left so that the index 0 is included, but open in the right so the index $n$ is _not_ included such that we don't fall of the right edge of the array index and end up with an _off-by-one_ error.

## Resources

- https://www.mathsisfun.com/sets/intervals.html

