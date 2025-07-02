---
tags:
  - text-editor
  - gtk
  - gnome
  - linux
  - arch-linux
---
## Intro to Gnome Text Editor

![Gnome Text Editor on Arch Linux on 2025-07-02](gnome-text-editor-on-archlinux-2025-07-02.png)

- https://gitlab.gnome.org/GNOME/gnome-text-editor

Gnome Text Editor (not to be confused with GEdit) has support for sessions, and especially for me, vim mode.

My main editors are vim/nvim and Emacs, but I like to keep a simpler editor for taking quick notes or saving snippets of ideas and/or code.

```bash
$ gsettings set org.gnome.TextEditor keybindings vim
$ gsettings set org.gnome.TextEditor keybindings default
```

## vim key bindings

- https://askubuntu.com/questions/1439845/how-do-i-enable-vim-bindings-in-gnome-text-editor

![Gnome Text Editor vim keybindings on dconf editor on 2025-07-02](gnome-text-editor-dconf-editor-vim-keybindings-2025-07-02.png)

The cursor blinks by default, but it can be disabled by setting `org.gnome.desktop.interface` `cursor-blink` to `false`.

```bash
$ gsettings set org.gnome.desktop.interface cursor-blink false
```