---
tags:
  - emacs
  - text-editor
---

## Install on macOS

https://github.com/d12frosted/homebrew-emacs-plus

## Lines

- `M-x column-number-mode RET`


## fill-column

- https://stackoverflow.com/questions/3566727/how-to-set-the-default-width-of-fill-mode-to-80-with-emacs

## Update Packages From The Command Line
#emacs #package #update #cmdline

It seems most resources on updating Emacs packages from the command line make use of [auto-package-update.el (Github)](https://github.com/rranelli/auto-package-update.el).

- https://tsdh.org/posts/2021-06-06-update-all-emacs-packages-from-the-command-line.html
- https://systemcrafters.net/emacs-from-scratch/keeping-your-packages-up-to-date/

```lisp
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t))
```

Eval the sexp to install the package and close Emacs. Then, run one of the following commands from your shell:

```bash
$ emacs -f auto-package-update-now

$ emacs --eval '(progn (sit-for 2) (auto-package-update-now))'
```

# Resources

- https://www.nongnu.org/nethack-el/
- https://www.nethack.org/
- https://emacsredux.com/