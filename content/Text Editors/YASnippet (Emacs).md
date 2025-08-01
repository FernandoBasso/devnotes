---
tags:
  - emacs
  - text-editor
  - snippet
  - yasnippet
description: Notes and tips on using YASnippet snippets plugin for Emacs.
---
## Intro

- https://github.com/joaotavora/yasnippet
- https://joaotavora.github.io/yasnippet/

## Newlines

Sometimes we need snippets that don't insert a newline. For example, I have a snippet to add a "`;=>␠`" comment to note the output of some lisp/scheme expression.

```clojure
(+ 1 2)
^
```

Then with the cursor on the “^”, I type `C-u C-x C-e` to eval the last sexp and insert the result of the evaluation at point, so that it becomes this:

```clojure
(+ 1 2)
3
```

But then, I need to go to the beginning of the line and prepend the output with "`;=>␠`". The thing is, if the snippet file contains a trailing newline, after I expand the snippet to insert "`;=>␠`", then it inserts a newline so that it defeats the purpose:

```clojure
(+ 1 2)
;=>␠ 
3
```

So, when editing a YASnippet .snip.txt file, temporarily prevent Emacs from inserting the final new line:

```emacs-lisp
(setq require-final-newline nil)
```

Delete the final newline from the snippet file and save the file. Then, feel free to set `require-final-new-line` to `t` again.

```emacs-lisp
(setq require-final-newline t)
```
