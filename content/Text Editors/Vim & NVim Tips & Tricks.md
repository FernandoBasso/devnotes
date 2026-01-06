---
tags:
  - vim
  - nvim
---
## Save with sudo

You open a file that requires root privileges to save as a normal user.
To save as admin:

```
:write !sudo tee %
```

- https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work

## Print lua code on command line

Print lua code on nvim's command line without the need of `print()`. E.g.:

```text
:= vim.fn.getjumplist()
:= vim.fn.getline('.')
```

## Open cmdline on a buffer

This is similar to `C-x C-e` on the shell, which allows typing the command on `$EDITOR` and run it when closing the buffer and quitting vim.

```
:set listchars<C-f>

:%s /foo/<C-f>
```