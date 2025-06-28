---
tags:
  - linux
  - desktop
  - gnome
  - window-manager
  - desktop-environment
---
# Alt+Tab (App Switcher)

Display only applications from the current workspace (`dconf-editor`):

![Gnome App Switcher (alt+tab) only display current workspace applications](gnome-app-switcher-alt-tab-only-current-worskpace.png)


Look for these settings in `dconf-editor` or from the command line:

```text
$ gsettings list-keys org.gnome.shell.window-switcher 
app-icon-mode
current-workspace-only

devnotes [devel *%|u+1]
$ gsettings list-keys org.gnome.shell.app-switcher
current-workspace-only
```

See:
- https://askubuntu.com/questions/464946/force-alt-tab-to-switch-only-on-current-workspace-in-gnome-shell

## Sound

```
$ gnome-control-center sound
```

Can also be searched:
![search gnome control center for sound configs](search-gnome-control-center-sound.png)

## Dock Volumes and Drives

Open `dconf-editor`, search for  “show-mount” and play with the available options.
![dconf-editor show-mounts on Gnome dash-to-dock](dconf-editor-show-mounts-gnome-dash-to-dock.png)

