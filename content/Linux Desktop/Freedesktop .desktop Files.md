---
tags:
  - desktop
  - freedesktop
---

## Intro

- https://www.freedesktop.org/wiki/Howto_desktop_files/

## Custom .desktop files
2025-06-20 10:50

![Gnome with custom firefox-developer-edition.desktop file](gnome-with-custom-firefox-dev-desktop-file.png)

Here a sample `.desktop` file for Firefox Developer Edition that I run from `~/bin`:

```
$ cat ~/.local/share/applications/firefox-developer-edition.desktop 
[Desktop Entry]
Version=1.0
Type=Application
Name=Firefox Developer Edition
Comment=Firefox Developer Edition
Exec=/home/deveng/bin/firefox-developer-edition/firefox %u
Terminal=false
X-MultipleArgs=false
Icon=/home/deveng/Pictures/firefox-developer-edition.png
StartupWMClass=firefox-dev
DBusActivatable=false
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
StartupNotify=true
Actions=new-window;new-private-window;open-profile-manager;
```

For the `StartupWMClass`, on Xorg we can type `xprop WM_CLASS` and then click on the application we want to discover the WM_CLASS for.
On Wayland with Gnome, `lg` (looking glass) can be used.
Open Gnome's command runner with `Alt+F2`, type `lg` and click on the “Windows” tab and look for the “wmclass” property.

