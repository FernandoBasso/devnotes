---
tags:
  - desktop
  - freedesktop
description: Notes, tips and examples on working with .desktop files on Linux.
---

## Intro

- https://www.freedesktop.org/wiki/Howto_desktop_files/

## Custom .desktop files
2025-06-20 10:50

![Gnome with custom firefox-developer-edition.desktop file](gnome-with-custom-firefox-dev-desktop-file.png)

Here a sample `.desktop` file for Firefox Developer Edition that I run from `~/bin`:

```
[Desktop Entry]
Version=1.0
Type=Application
Name=Firefox Developer Edition
Exec=/home/devy/bin/firefox-dev/firefox
Icon=/home/devy/bin/firefox-dev/browser/chrome/icons/default/default128.png
Terminal=false
X-MultipleArgs=false
StartupWMClass=firefox-dev
DBusActivatable=false
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
StartupNotify=true
Actions=new-window;new-private-window;open-profile-manager

[Desktop Action new-window]
Name="Firefox Dev New Window"
Exec=/home/devy/bin/firefox-dev/firefox --new-window

[Desktop Action new-private-window]
Name=Firefox Dev New Private Window
Exec=/home/devy/bin/firefox-dev/firefox --private-window

[Desktop Action open-profile-manager]
Name=Firefox Dev Open Profile Manager
Exec=/home/devy/bin/firefox-dev/firefox --ProfileManager
```

To validate the file and install it, run this:

```bash
$ sudo desktop-file-install ./firefox-dev.desktop
```

Its final destination, after installed, is:

```
/usr/share/applications/firefox-dev.desktop
```

For the `StartupWMClass`, on Xorg we can type `xprop WM_CLASS` and then click on the application we want to discover the WM_CLASS for.
On Wayland with Gnome, `lg` (looking glass) can be used.
Open Gnome's command runner with `Alt+F2`, type `lg` and click on the “Windows” tab and look for the “wmclass” property.

![Gnome looking glass WM_CLASS](gnome-looking-glass-wmclass.png)

- https://askubuntu.com/questions/367396/what-does-the-startupwmclass-field-of-a-desktop-file-represent
