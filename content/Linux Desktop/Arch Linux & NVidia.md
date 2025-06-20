---
tags:
  - arch-linux
  - nvidia
---

## Cannot access tty
2025-06-20 16:14

Pressing `Ctrl+Alt+F3` would result in a non-responsive black screen.

Added `nvidia_drm.modeset=1 nvidia_drm.fbdev=0` to `GRUB_CMDLINE_LINUX_DEFAULT` in  `/etc/default/grub`.
After a restart, it was possible to use tty 1, 2, 3, etc.
Still, trying to get back to Xfce in TTY 7 would result in a non-responsive black screen for the GUI...

Tried these lines to `/etc/modprobe.d/blacklist.conf`:
```
install i915 /usr/bin/false
install intel_agp /usr/bin/false
install viafb /usr/bin/false
install radeon /usr/bin/false
install amdgpu /usr/bin/false
```
