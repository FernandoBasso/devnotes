---
tags:
  - clojure
  - comparison
  - equal
---
## Equality

`=` is strict comparison as it requires the type to be the same. For example, `(= 1 1.0)` is not equal as 1 is an int type, and 1.0 is a float type. `=` is similar to `===` in ECMAScript and PHP.

`==` is not strict on the type. `(== 1 1.0)` is considered equal as the types are ignored. It is similar to `==` in ECMAScript and PHP.

> [!WARNING]
>
> Clojure has `=` and `==`. ECMAScript has `==` and `===`. In Clojure, the shorter operator is type-strict, while in ECMAScript the longer operator is type-strict. Conversely, in Clojure, the longer operator is non-type-script while in ECMAScript the shorter operator is non-type-strict.

> [!NOTE] Fun fact about ECMAScript committee on equality operators
>
> Douglas Crockford said that the ECMAScript committee tried to change the spec make `==` type-strict and `===` non-type-strict, but Microsoft at the time said they could not break language in a non-backwards-compatible way (and therefore break websites) so it was never “fixed”.

## Not Equal

Clojure has `not=` for _not equal_ (instead of `!=` ).

> [!NOTE] `not=` is not “wrong” or “strange”
>
> Haskell has `/=` for _not equal_. And remember that standard SQL _not equal_ is `<>`, even though some DB vendors support the non-standard `!=`.
>
> So, `not=` is not strange. Just different than in some other languages that use `!=`. Keep an open mind.


