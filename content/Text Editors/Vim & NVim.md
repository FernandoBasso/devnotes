---
tags:
  - text-editor
  - vim
  - nvim
description: Notes and resources on vim and nvim text editors.
---

# Lazy.nvim delete everything

```text
rm -rvf \
  ~/.local/state/nvim \
  ~/.local/share/nvim \
  ~/.cache/nvim
```


## Update with vim.pack.update()
#nvim #update #pack

> [!NOTE]
> Works on nvim 0.12.

```text
nvim \
  --headless \
  -c 'lua vim.pack.update(nil, {force = true})' \
  -c qa
```

> [!TIP]
>`vim.pack.update()` **is** *synchronous*, so `-c qa` will naturally execute only after the update finishes.

## Resources

- https://neovim.io/, the official Neovim website.
- https://www.bobavim.com/ Game shared by its author (Flofo) on Vim BR Telegram group.
