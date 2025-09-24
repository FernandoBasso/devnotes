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

(use-package treemacs-all-the-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-add-and-display-current-project-exclusively)
  (treemacs-follow-mode t))
```

Run `M-x all-the-icons-install-fonts`.
