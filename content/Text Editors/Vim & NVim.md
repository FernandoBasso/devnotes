---
tags:
  - text-editor
  - vim
  - nvim
description: Notes and resources on vim and nvim text editors.
---

## Install on Linux

Except for Arch Linux repos, both vim and neovim are generally outdated. Neovim has awesome releases for all supported OSes and it is easy to install from the pre-compiled binaries.

On Linux, feel free to copy and paste this bash script into your shell (no superuser/sudo privileges required, all happens in your home directory):

```text
nvim_url='https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz'

rm -rvf ~/bin/nvim-linux-x86_64

mkdir -pv ~/bin

curl \
  --location \
  --output - \
  "$nvim_url" | \
  tar -C ~/bin/ -xzvf -
```

Then add `$HOME/bin/nvim-linux-x86_64/bin` to `PATH`. In your shell configuration file, like `$HOME/.bashrc`, add something like this:

```text
export PATH="$HOME/bin/nvim-linux-x86_64/bin:$PATH"
```

Restart your shell, or `source` the RC config file and try `which nvim`. It should show the place where it is found.

```text
$ which nvim
~/bin/nvim-linux-x86_64/bin/nvim

$ nvim --version
NVIM v0.12.2
Build type: Release
LuaJIT 2.1.1774638290
Run "nvim -V1 -v" for more info

$ type nvim
nvim is hashed (/home/devy/bin/nvim-linux-x86_64/bin/nvim)

$ file $(which nvim)
/home/devy/bin/nvim-linux-x86_64/bin/nvim: ELF 64-bit LSB pie executable,
x86-64, version 1 (SYSV), dynamically linked,
interpreter /lib64/ld-linux-x86-64.so.2,
BuildID[sha1]=c645e0eabbbe09afc9cade8ba6715aadd1ffbe2b,
for GNU/Linux 3.2.0, with debug_info, not stripped
```

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
