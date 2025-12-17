---
tags:
  - number
  - integer
  - collection
  - math
  - dsa
description: Ideas relating to performing operations on digits of a number, like extracting the first or last digit, counting the number of digits, etc. Includes some simple and useful math and division concepts.
---
## Intro

Some concepts, notes, tips and examples on how to extract digits from a number. For example:

- Count digits in a number.
- Extract first and last digits.
- Extract first n digits.
- Extract last n digits.
- Turn a number into an array of its digits.
- What else?

Most of it apply only to integers, or whole numbers (positive integers).

Some solutions on the web involve converting the number to a string, slicing it to get the desired digits, and then converting the sliced parts back to a number. That is fine but there are also, sometimes, some more mathematical approaches to the problem (which would also be more performant).

## Notes on rounding down to integer

Rounding a number down to an integer can be done with `floor`-like functions in many languages, or with a bitwise operation.

```
$ node --interactive

> var n = 794;

> while (n >= 10) n /= 10;
7.94

> n
7.94

> n ^ 0
7
```

We could also do `n | 0` or `~~n`. And of course, `Math.trunc()` and `Math.floor()`.

PureScript uses `n | 0` (saw it in the source code). [@natefaubion PureScript Discord server](https://discord.com/channels/864614189094928394/865617619464749081/1015376935485968474) told me “it will wrap to an int32 range” and that “it was an old trick from asm.js.”

```js
//
// .spago/prelude/v6.0.0/src/Data/Ring.js
//
export const intSub = function (x) {
  return function (y) {
    return x - y | 0;
  };
};
```

Bitwise operators in ECMAScript convert the number operands to int32, which make the o the result is an integer value.
That is why bitwise operations on ECMAScript numbers return numbers without the fractional part.

> A bitwise operator treats their operands as a set of 32 bits (zeros and ones), rather than as decimal, hexadecimal, or octal numbers. Bitwise operators perform their operations on such binary representations, but they return standard JavaScript numerical values.
>
> — [MDN docs on bitwise operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#bitwise_operators)

- [ECMAScript spec on bitwise operations](https://tc39.es/ecma262/#sec-numberbitwiseop).
- [MDN Docs on bitwise oprators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#bitwise_operators).

## Count digits in a number

To count the digits in a number, *log base 10* is helpful. For example, `log10(100)` is 2 and `log10(1000)` is 3. Note we get one less than the actual number of digits in each case.

Similarly, `log10(99)` is ≃ 1.9 and `log10(199)` is ≃ 2.9. If we round down to the integer part, we again get 1 and 2, which is again one less than the number of digits for each number. Therefore, we can simply add 1 and we get the count of digits in a number.

```
$ node --interactive

> log10(100) + 1
3

> log10(1000) + 1
4

> floor(log10(99)) + 1
2

> log10(99)
1.99563519459755

> floor(log10(99)) + 1
2
```

We just floor the result of the `log10` and add 1 to that and we are done.
And we have to remember that logarithms with 0 yields `Infinity`, while logarithms with negative integers yield `NaN`, so, we can just handle the 0 case conditionally, and get the absolute value for the given number before performing the logarithm operation.

### JavaScript

For this solution we use the `OR` (`|`) bitwise operation with 0 (instead of the `floor` function, which we could just as well) to “remove” the decimal part.

```javascript
const abs = Math.abs.bind(Math);
const log10 = Math.log10.bind(Math);

/**
 * Returns the number of digits in `num`.
 *
 * @param {number} num
 * @returns {number}
 */
export function countDigits(num) {
  if (num === 0) return 1;
  return (log10(abs(num)) + 1) | 0;
}
```

## umber into array of its digits

Using the modulo operation to keep getting the last digit and adding it to the **front** of the array.

- 1. Let `digits` be an empty array.
- 2. While `n >= 10`:
   - a. Let `m` be the result of `n` module `10`.
   - b. Let `n` be the result of flooring `n` divided by `10`
   - c. Add `m` to the front of `digits`.
- 3. Add floored `n` to the front of `digits`.
- 4. Return `digits`.

For 793, this is how it goes:

```text
793 % 10      -> 3
793 / 10 | 0  -> 79
digits is [3]
           ^

79 % 10       -> 9
79 / 10 | 0   -> 7
(note we need to add 9 *before* 3 in digits)
[9, 3]
 ^

Add remaining 7 in front of [9, 3]
[7, 9, 3]
 ^
```

At each iteration of the loop, `n` is relieved of its last digit, and `digits` gets that digit added to is beginning.
### JavaScript

```javascript
const abs = Math.abs.bind(Math);

/**
 * Turns a number into an array of its digits.
 *
 * @category List
 * @signature number -> Number[]
 * @param {number} num
 * @returns {number[]}
 * @example
 * numToDigits(-1894);
 * // → [1, 9, 8, 4]
 */
function numToDigits(num) {
  var n = abs(num);
  var digits = [];

  while (n >= 10) {
    var last = n % 10;
    n = n / 10 | 0;

    digits.unshift(last);
  }

  digits.unshift(n | 0);

  return digits;
}
```


## Array of integers to a single integer

For example, `[7, 5, 3]` is 753. The logic is to use the positional system concepts and do something like this:

- $7 \times 10 ^ 2 = 700$
- $5 \times 10 ^ 1 = 50$
- $3 \times 10 ^ 0 = 3$

Therefore, $700 + 50 + 3 = 753$.

### JavaScript v1

```javascript
function digitsToNum(digits) {
  let num = 0,
        i = 0,
        e = digits.length - 1;

  while (e >= 0)
    num += digits[i++] * 10 ** e--; 

  return num;
}

/*

*/

log(digitsToNum([0]));
//=> 0

log(digitsToNum([7]));
//=> 7

log(digitsToNum([0, 7]));
//=> 7

log(digitsToNum([7, 0]));
//=> 7

log(digitsToNum([8, 0, 9, 6]));
//=> 8096
```

Two variables `i` and `e` are used to control the current digit index and the exponent.

```text
num = 0
 xs = [5, 7, 4]
 i  = 0
 e  = 2

num += xs[i] * 10 ** e
num += xs[0] * 10 ** 2
num += 5     * 100
num += 500
num is 0 so num = 500

Increment i to 1, decrement e to 1.

num += xs[i] * 10 ** e
num += xs[1] * 10 ** 1
num += 7     * 10
num += 70
num is 500, 500 + 70, num = 570

Increment i to 2, decrement e to 0.

num += xs[i] * 10 ** e
num += xs[2] * 10 ** 0
num += 4     * 10 ** 0
num += 4     * 1
num += 4
num is 570, 570 + 4, num = 574

Increment i to 3, decrement e to -1. Loop test is false. Stop.
```

### JavaScript v2

But because in the previous solution, both `i` and `e` are derived related or derived from the length of the input array of digits, we can make do with simply `i`:

```javascript
function digitsToNum(digits) {
  let num = 0;

  for (let i = 0; i < digits.length; ++i)
    num += digits[i] * 10 ** (digits.length - 1 - i);

  return num;
}
```

Now we derive the exponent with `digits.length - 1 - i`. As `i` increases, the derived exponent decreases, which is what we want.

```text
 xs = [5, 7, 4]
num = 0
len = 3
  i = 0
  
xs[i] * 10 ** (len - 1 - i)
xs[0] * 10 ** (3   - 1 - 0) (because i is 0)
5     * 10 ** (3   - 1)
5     * 10 ** 3
500

num += 500
num is 500

Increment i so that i = 1.

xs[i] * 10 ** (len - 1 - i)
xs[1] * 10 ** (3   - 1 - 1) (because i is now 1)
7     * 10 ** (3   - 2) 
7     * 10 ** 1
70

num += 70
num = 570

Increment i so that i = 2.

xs[i] * 10 ** (len - 1 - i)
xs[2] * 10 ** (3   - 1 - 2) (because i is now 2)
4     * 10 ** (3   - 3)
4     * 10 ** 0
4

num += 4
num = 574

Increment i so that i is 3. At this point, i < len is false
and the loop stops.
```

### JavaScript v3

It is possible to even do it without the exponent, just always multiplying by 10 and adding each digit in turn.

```javascript
function digitsToNum(digits) {
  let num = 0,
        i = 0;

  while (i < digits.length)
    num = num * 10 + digits[i++];

  return num;
}

log(digitsToNum([5, 3, 7]));
//=> 537
```

```text
 xs = [5, 7, 4]
num = 0
len = 3
  i = 0
  
num = num * 10 + xs[i]
num = 0   * 10 + xs[0]
num = 0   * 10 + 5
num = 0        + 5
num = 5

Increment i to 1.

num = num * 10 + xs[i]
num = 5   * 10 + xs[1]
num = 5   * 10 + 7
num = 5   * 10 + 7
num = 50       + 7
num = 57

Increment i to 2.

num = num * 10 + xs[i]
num = 57  * 10 + xs[2]
num = 57  * 10 + 4
num = 570      + 4
num = 574

Increment i to 3, which causes the test in the loop to
be false and the loop stops.
```

## Take first digit from number

Keep dividing the number by 10 while the number is greater than 10 and then, if there are decimal places left, apply an operation to round it down to the nearest integer.

### JavaScript

```javascript
/**
 * Returns the first digit of a number.
 *
 * @category math
 * @sig Number -> Number
 * @param {number} num
 * @returns {number}
 */
function getFirstDigit(num) {
  if (num < 0) throw new RangeError('num must be >= 0');

  var x = num;
  while (x >= 10) x /= 10;
  return x | 0;
}
```

## Take last digit from number

To get the last digit of an integer, simply do modulo division by 10.

### JavaScript

```
$ node --interactive

> 1984 % 10
4
> -1984
-1984
> (1e3 + 7) % 10
7
```

No matter the length of the number, it always works.
No loop or conversion to string with some split is necessary.

```javascript
/**
 * Returns the last digit of a number.
 *
 * The number must not contain a decimal place. That is, 35.7 is an
 * invalid input for this function and will result an exception, while
 * 357 is valid, and will return 7.
 *
 * @category math
 * @signature Number -> Number
 * @param {number} num
 * @returns {number}
 */
function getLastDigit(num) {
  if (!Number.isInteger(num))
    throw new RangeError('num must be an integer');

  return num % 10;
}
```

## Take first n digits from number

If we have 12345, and we keep dividing it by 10 and flooring the result, we keep “dropping” the last digit:

```
$ node --interactive

> var n = 12345;

> n / 10
1234.5

> n / 10 | 0
1234

> n / 10 / 10 | 0
123

> n / 10 / 10 / 10 | 0
12

> n / 10 / 10 / 10 / 10 | 0
1
```

If we want to get the first three digits, we have to “drop” the last two.
Or, we have to divide by 10 two times, which is the same as dividing by (10 * 10), which is 10 to the second power.

We can do a loop, something like:

```js
var n = 12345;
while (countDigits(n) > 3)
  n = n / 10 | 0
// → 12
```

Or

```js
var n = 12345;
for (var i = 0; i < 5 - 2; ++i)
  n = n / 10 | 0;
// → 12
```

Then we can think of this logic: “to get the first *n* digits, we need to drop the last *m* digits.”
If the number has five digits, and we want the first three, 5 - 3 is 2.
We need to drop the last two digits.
And we know that “dropping the last two digits” means dividing by 10 two times, or by `10 / pow(10, 2)`.

```
$ node --interactive

> n / pow(10, 5 - 1) | 0
1

> n / pow(10, 5 - 2) | 0
12

> n / pow(10, 5 - 3) | 0
123

> n / pow(10, 5 - 4) | 0
1234

> n / pow(10, 5 - 5) | 0
12345
```

### JavaScript

```javascript
const abs = Math.abs.bind(Math);
const pow = Math.pow.bind(Math);

/**
 * Take the first `len` digits from `num`.
 *
 * Negative numbers are treated as positive.
 *
 * If the number of digits in `num` is less than or equal to
 * `len`, simply return `num`.
 *
 * @example
 * takeDigits(1984, 4);
 * // → 1984
 *
 * takeDigits(-1984, 2);
 * // → 19
 *
 * @param {number} num
 * @param {number} len
 * @returns {number}
 */
function takeDigits(num, len) {
  if (typeof len !== "number" || len < 1)
    throw new RangeError("len must be a number >= 1");

  if (num === 0) return num;

  var n = abs(num);
  var numDigits = countDigits(n);

  if (numDigits <= len)
    return n | 0;

  return (n / pow(10, numDigits - len)) | 0;
}
```

Note that we use `countDigits()` which was defined earlier.
## Drop first n digits from number

For this we can make use of powers of 10 mixed with taking the last digit in a loop.

```text
num = 7953

last = 7953 % 10             -> 3
num  = 7953 / 10 | 0         -> 795
out  = 3 * 10 ** 0            -> 3

last = 795 % 10              -> 5
num  = 795 / 10 | 0          -> 79
out  = 5 * 10 ** 1 + out     -> 53
```

- `n % 10` returns the last digit in `n`.
- `n / 10 | 0` returns `n` without the last digit.
- `x * 10 ** exp` makes use of the knowledge that we use a positional numeric system.
  `digit * 10 ** 0` for the one's place, `digit * 10 ** 1` for the ten's place, `digit * 10 ** 2` for the hundred's place, etc.
  For example:
  - `7 * 10 ** 0` is 7.
  - `7 * 10 ** 1` is 70.
  - `7 * 10 ** 2` is 700.

### JavaScript

```javascript
const abs = Math.bind.abs(Math);

/**
 * Drops the first `len` digits from `num`.
 *
 * @example
 * dropDigits(1234, 2);
 * // → 34
 *
 * dropDigits(123, 3);
 * // → 123
 *
 * dropDigits(123, 4);
 * // → 123
 *
 * @param {number} num The number to drop the first `len` digits from.
 * @param {number} len The number of digits to drop from the beginning
 *   of the number. It has to be less than the number of digits in the
 *   number.
 * @returns {number} The number with `len` digits dropped from its
 *   beginning or the unmodified number if `len` is less than the number
 *   of digits in the input number.
 */
function dropDigits(num, len) {
  var n = abs(num);

  if (countDigits(n) <= len) return n;

  var out = 0;
  var numLen = countDigits(n);

  for (var exp = 0; exp < numLen - len; ++exp) {
    var last = n % 10 * 10 ** exp;
    var n = n / 10 | 0;
    out = last + out;
  }

  return out;
}
```

Note that we use `countDigits()` which was defined earlier.
## References

- [How do I determine the number of digits of an integer in C? (StackOverflow)](https://stackoverflow.com/questions/1068849/how-do-i-determine-the-number-of-digits-of-an-integer-in-c).
- [How To Get First N Digits Of A Number](https://www.c-sharpcorner.com/blogs/how-to-get-first-n-digits-of-a-number).