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

