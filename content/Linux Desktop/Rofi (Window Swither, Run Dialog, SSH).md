---
tags:
  - linux
  - desktop
  - rofi
---
## Intro

This shows the monitors/displays detected.

```bash
$ rofi --help
```

To always show rofi on the main display:

```bash
$ rofi -show window -monitor 1
```


## Generate default config

```bash
$ mkdir -pv ~/.config/rofi
$ 1> ~/.config/rofi/config.rasi \
    rofi -show window -debug dump-config
```

A very simple but good, initial default config:

```bash
configuration {
  show-icons: true;
  window-format: "{c}   {t}    {w}";
}

@theme "/usr/share/rofi/themes/gruvbox-light.rasi"
```

Works OK with `rofi -show window -monitor 1`.
