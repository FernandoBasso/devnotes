---
tags:
  - emacs
  - lsp
  - text-editor
description: Tips, notes and examples on using the language server protocol (lsp) with Emacs.
---
## Intro

Currently, my prefix for LSP-related commands is `C-c l`, due to my config:

```lisp
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((clojure-ts-mode . lsp)
          (haskell-mode . lsp)
          (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
```

## List of keybindings

Refactor, rename: `C-c l r r`.
