---
tags:
  - dnf
  - fedora
description: Tips and tips on how to perform common tasks with the dnf package manager and RPM packages
---
## Similar to apt-file (deb-based) and pkgfile (Arch Linux)

On Debian I have apt-file. On Arch, pkgfile. On Fedora, how to search which package provides certain tools, commands or libs?

![Playwright lib dependencies on Fedora](playwright-lib-dependencies-on-fedora.png)

Examples:

```text
$ pkgfile --search libffi.so.7
$ apt-file search libffi.so.7
$ dnf repoquery --provides '/**/libffi.so.7'
```

It's generally `libfoo` for the library or `libfoo-devel` for development packages. `libicudata.so` is an exception to that rule.

Fun fact: if the library is packaged with the right version in Fedora, you can also run `dnf install <lib name>`. For example `dnf install libffi.so.7` will work. It may install a package other than `libffi-devel` in if the soname. For example, if `ghc8.10-base` contains `libffi.so.7`, and `libffi.so` is on version 8, then it will install the GHC one.

Also, some libs are versionless (they don't contain a version number after `.so`.

