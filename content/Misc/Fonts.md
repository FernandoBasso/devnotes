---
tags:
  - font
  - utf8
  - unicode
  - emoji
---
## Intro

Also see [Unicode & UTF-8](Unicode%20&%20UTF-8.md).

## Ubuntu

Ubuntu 2025.04 with most Unicode fonts already installed:

```bash
$ fc-list : family | sort | wc -l
288

$ fc-list : family | grep Noto | wc -l
210
```

A lot of Google's Unicode and Emoji Noto fonts are installed by default.

## Myna

https://github.com/sayyadirfanali/Myna