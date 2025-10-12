---
tags:
  - homebrew
  - macos
  - linux
  - install
description: Notes, tips and examples on installing and using Homebrew package manager on macOS and Linux systems.
---
## Intro

On Arch Linux, install these dependencies:

```text
$ sudo pacman --sync --refresh --needed \
    base-devel procps-ng curl file git
```

```text
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
==> Checking for `sudo` access (which may request your password)...
[sudo] password for devy: 
==> This script will install:
/home/linuxbrew/.linuxbrew/bin/brew
/home/linuxbrew/.linuxbrew/share/doc/homebrew
/home/linuxbrew/.linuxbrew/share/man/man1/brew.1
/home/linuxbrew/.linuxbrew/share/zsh/site-functions/_brew
/home/linuxbrew/.linuxbrew/etc/bash_completion.d/brew
/home/linuxbrew/.linuxbrew/Homebrew
==> The following new directories will be created:
/home/linuxbrew/.linuxbrew/bin
/home/linuxbrew/.linuxbrew/etc
/home/linuxbrew/.linuxbrew/include
/home/linuxbrew/.linuxbrew/lib
/home/linuxbrew/.linuxbrew/sbin
/home/linuxbrew/.linuxbrew/share
/home/linuxbrew/.linuxbrew/var
/home/linuxbrew/.linuxbrew/opt
/home/linuxbrew/.linuxbrew/share/zsh
/home/linuxbrew/.linuxbrew/share/zsh/site-functions
/home/linuxbrew/.linuxbrew/var/homebrew
/home/linuxbrew/.linuxbrew/var/homebrew/linked
/home/linuxbrew/.linuxbrew/Cellar
/home/linuxbrew/.linuxbrew/Caskroom
/home/linuxbrew/.linuxbrew/Frameworks

Press RETURN/ENTER to continue or any other key to abort:
==> /usr/bin/sudo /usr/bin/install -d -o devy -g devy -m 0755 /home/linuxbrew/.linuxbrew
==> /usr/bin/sudo /bin/mkdir -p /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/etc /home/linuxbrew/.linuxbrew/include /home/linuxbrew/.linuxbrew/lib /home/linuxbrew/.linuxbrew/sbin /home/linuxbrew/.linuxbrew/share /home/linuxbrew/.linuxbrew/var /home/linuxbrew/.linuxbrew/opt /home/linuxbrew/.linuxbrew/share/zsh /home/linuxbrew/.linuxbrew/share/zsh/site-functions /home/linuxbrew/.linuxbrew/var/homebrew /home/linuxbrew/.linuxbrew/var/homebrew/linked /home/linuxbrew/.linuxbrew/Cellar /home/linuxbrew/.linuxbrew/Caskroom /home/linuxbrew/.linuxbrew/Frameworks
==> /usr/bin/sudo /bin/chmod ug=rwx /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/etc /home/linuxbrew/.linuxbrew/include /home/linuxbrew/.linuxbrew/lib /home/linuxbrew/.linuxbrew/sbin /home/linuxbrew/.linuxbrew/share /home/linuxbrew/.linuxbrew/var /home/linuxbrew/.linuxbrew/opt /home/linuxbrew/.linuxbrew/share/zsh /home/linuxbrew/.linuxbrew/share/zsh/site-functions /home/linuxbrew/.linuxbrew/var/homebrew /home/linuxbrew/.linuxbrew/var/homebrew/linked /home/linuxbrew/.linuxbrew/Cellar /home/linuxbrew/.linuxbrew/Caskroom /home/linuxbrew/.linuxbrew/Frameworks
==> /usr/bin/sudo /bin/chmod go-w /home/linuxbrew/.linuxbrew/share/zsh /home/linuxbrew/.linuxbrew/share/zsh/site-functions
==> /usr/bin/sudo /bin/chown devy /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/etc /home/linuxbrew/.linuxbrew/include /home/linuxbrew/.linuxbrew/lib /home/linuxbrew/.linuxbrew/sbin /home/linuxbrew/.linuxbrew/share /home/linuxbrew/.linuxbrew/var /home/linuxbrew/.linuxbrew/opt /home/linuxbrew/.linuxbrew/share/zsh /home/linuxbrew/.linuxbrew/share/zsh/site-functions /home/linuxbrew/.linuxbrew/var/homebrew /home/linuxbrew/.linuxbrew/var/homebrew/linked /home/linuxbrew/.linuxbrew/Cellar /home/linuxbrew/.linuxbrew/Caskroom /home/linuxbrew/.linuxbrew/Frameworks
==> /usr/bin/sudo /bin/chgrp devy /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/etc /home/linuxbrew/.linuxbrew/include /home/linuxbrew/.linuxbrew/lib /home/linuxbrew/.linuxbrew/sbin /home/linuxbrew/.linuxbrew/share /home/linuxbrew/.linuxbrew/var /home/linuxbrew/.linuxbrew/opt /home/linuxbrew/.linuxbrew/share/zsh /home/linuxbrew/.linuxbrew/share/zsh/site-functions /home/linuxbrew/.linuxbrew/var/homebrew /home/linuxbrew/.linuxbrew/var/homebrew/linked /home/linuxbrew/.linuxbrew/Cellar /home/linuxbrew/.linuxbrew/Caskroom /home/linuxbrew/.linuxbrew/Frameworks
==> /usr/bin/sudo /bin/mkdir -p /home/linuxbrew/.linuxbrew/Homebrew
==> /usr/bin/sudo /bin/chown -R devy:devy /home/linuxbrew/.linuxbrew/Homebrew
==> Downloading and installing Homebrew...
remote: Enumerating objects: 312770, done.
remote: Counting objects: 100% (296/296), done.
remote: Compressing objects: 100% (161/161), done.
remote: Total 312770 (delta 208), reused 179 (delta 135), pack-reused 312474 (from 5)
remote: Enumerating objects: 55, done.
remote: Counting objects: 100% (33/33), done.
remote: Total 55 (delta 33), reused 33 (delta 33), pack-reused 22 (from 1)
==> Updating Homebrew...
==> Downloading https://ghcr.io/v2/homebrew/portable-ruby/portable-ruby/blobs/sha256:5ea0e3a30feef0743da5a2924c8a71baead1b9f1d571afbd675bc556e59705f5
######################################################################## 100.0%
==> Pouring portable-ruby-3.4.5.x86_64_linux.bottle.tar.gz
Warning: /home/linuxbrew/.linuxbrew/bin is not in your PATH.
  Instructions on how to configure your shell for Homebrew
  can be found in the 'Next steps' section below.
==> Installation successful!

==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
Read the analytics documentation (and how to opt-out) here:
  https://docs.brew.sh/Analytics
No analytics data has been sent yet (nor will any be during this install run).

==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
  https://github.com/Homebrew/brew#donations

==> Next steps:
- Run these commands in your terminal to add Homebrew to your PATH:
    echo >> /home/devy/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/devy/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
- Install Homebrew's dependencies if you have sudo access:
    sudo pacman -S base-devel
  For more information, see:
    https://docs.brew.sh/Homebrew-on-Linux
- We recommend that you install GCC:
    brew install gcc
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh
```
