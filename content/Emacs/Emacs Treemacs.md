---
tags:
  - emacs
  - treemacs
  - text-editor
  - tree-view
  - project
description: Tips and examples on configuring and using Treemacs.
---
## Links and resources

- https://github.com/Alexander-Miller/treemacs
- 
## Install

```lisp
(use-package treemacs-all-the-icons
  :ensure t
  :after treemacs)

(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-load-theme "all-the-icons"))
```

Run `M-x all-the-icons-install-fonts`.
