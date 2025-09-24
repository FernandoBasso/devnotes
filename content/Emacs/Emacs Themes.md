---
tags:
  - emacs
  - themes
  - colors
description: Notes, tips and examples about installing and configuring Emacs themes.
---

## Intro

I mostly use light themes as I have to alternate the editor with other apps that either have light themes by default, or the dark theme is dark (even for slide presentations, dark themes are not easy for other to read).

Somehow, my eyes also suffer from light coming from the window or something, and then the contrast with dark themes gives me an uncomfortable feeling in the eyes.

Therefore, I mostly stick to light themes, even though I find dark themes very pretty as well.

I also dislike very much italics for comments. Other symbols are OK to be italics sometimes, but disable all italics in a theme if possible. I don't can't bring myself to like code in plain text editor with italics...
## M-x disable-theme

It is important that when trying different themes without restarting emacs, we first run `M-x disable-theme` **before** trying a new theme. It is important as sometime the previous themes leave behind colors and configs that are not overwritten by the new theme, so the colors get messy, incompatible or whatever, in a way that it just feels “wrong”.

## Light Themes

### Catppuccin Latte

https://github.com/catppuccin/emacs

```emacs-lisp
;;
;; https://github.com/catppuccin/emacs
;;
 (use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin)
  (setq catppuccin-flavor 'latte))
```

## Modus Operandi

https://github.com/protesilaos/modus-themes

```lisp
;;
;; https://github.com/protesilaos/modus-themes
;;
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi))
```
