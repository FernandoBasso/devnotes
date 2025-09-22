---
tags:
  - emacs
  - paredit
  - text-editor
description: Notes, tips and examples with practical guidance on using Paredit to work with languages in the Lisp family.
---
## Intro

> [!NOTE] Point (cursor)
> In these notes and examples, assume “|” represents the place where point (cursor) is.

## paredit-forward-slurp-sexp

> [!TIP]
> Run `C-h paredit-forward-slurp-sexp` to read its documentation.

Noticed that `paredit-forward-slurp-sexp` does not slurp into an empty s-exp, for example:

```text
(|) a b
```

Calling the function `paredit-forward-slurp-sexp` **does not** bring "a" inside the parenthesis. The whole thing is unchanged. But if there is already something inside the parenthesis, then it works:

```text
(z|) a b
```

Apply `paredit-forward-slurp-sexp`, and the result is:

```text
(z a) b
```

Also, even if one or more space/whitespace characters are inside the s-exp, it still doesn't work. So, it has to be some actual printable/visible characters inside the s-exp for the slurp to work.