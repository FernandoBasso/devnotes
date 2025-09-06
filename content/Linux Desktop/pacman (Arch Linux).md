---
tags:
  - arch-linux
  - pacman
  - package-manager
  - search
description: Notes, tips and examples on managing packages on Arch Linux with pacman and related tools
---
## Search By Package name

The default `pacman` search returns packages that partially match either either the package name or the package description. For example `pacman --sync --search emote` will return a lot of stuff that contains the word “remote”.

But we can use `pacsift` (from extra, as of 2025). It is also a dependency of `aurutils`.

```bash
$ pacsift --sync --regex --name 'emote'
extra/gnome-remote-desktop
extra/qt5-remoteobjects
extra/qt6-remoteobjects
extra/soapyremote
extra/transmission-remote-gtk
aurpkgs/emote


$ pacsift --sync --regex --name '^emote'
aurpkgs/emote

$ pacsift --sync --regex --name '^pipewire'
extra/pipewire
extra/pipewire-alsa
extra/pipewire-audio
extra/pipewire-docs
extra/pipewire-ffado
extra/pipewire-jack
extra/pipewire-jack-client
extra/pipewire-libcamera
extra/pipewire-media-session
extra/pipewire-pulse
extra/pipewire-roc
extra/pipewire-session-manager
extra/pipewire-v4l2
extra/pipewire-x11-bell
extra/pipewire-zeroconf
```

> [!NOTE] Option order
> The `--name PATTERN` option _must come after_ `--regex`.
