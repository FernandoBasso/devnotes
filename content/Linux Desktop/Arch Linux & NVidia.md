---
tags:
  - arch-linux
  - nvidia
---

## Cannot access tty
2025-06-20 16:14

Pressing `Ctrl+Alt+F3` would result in a non-responsive black screen.

Added `nvidia_drm.modeset=1 nvidia_drm.fbdev=0` to `GRUB_CMDLINE_LINUX_DEFAULT` in  `/etc/default/grub`.

After a restart, it was possible to use tty 1, 2, 3, etc. Still, trying to get back to Xfce in TTY 7 would result in a non-responsive black screen for the GUI...

Tried these lines to `/etc/modprobe.d/blacklist.conf`:

```
install i915 /usr/bin/false
install intel_agp /usr/bin/false
install viafb /usr/bin/false
install radeon /usr/bin/false
install amdgpu /usr/bin/false
```

No deal either.
### Second try
2025-07-06 07:50

- https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting
- https://bbs.archlinux.org/viewtopic.php?id=306771

```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 nvidia_drm.modeset=1 video=efifb"
```

Did not work either. Still no output on TTYs.

### Third attempt
2025-07-06 08:53

https://wiki.archlinux.org/title/NVIDIA/Troubleshooting#Black_screen_on_systems_with_integrated_GPU

```text
install i915 /usr/bin/false
install intel_agp /usr/bin/false
install viafb /usr/bin/false
install radeon /usr/bin/false
install amdgpu /usr/bin/false
```
