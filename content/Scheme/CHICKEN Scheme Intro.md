---
tags:
  - lisp
  - scheme
  - chicken
  - install
  - cmdline
  - compile
description: Intro notes on CHICKEN Scheme, how to install, and Emacs editor setup.
---

## Install on Arch Linux

> [!TIP]
> Part of these notes is based on this .txt:
> * http://parenteses.org/mario/misc/installing-chicken.txt

CHICKEN Scheme provides some commands like `csc` (CHICKEN Scheme Compiler) and `csi` (CHICKEN Scheme Interpreter), and few others. In some distros, including Arch Linux, those program names were later replaced with the .NET Mono stuff:

```shell-session
$ pkgfile --search csc
extra/calc
extra/mono

$ pkgfile --search csi
extra/mono
```

Which means if we have .NET Mono installed and try to type `csi` or `csc`, we’ll be invoking Mono tools rather than CHICKEN Scheme tools.

If we don’t have .NET Mono packages installed, we can simply install CHICKEN Scheme from the official Arch Linux repositories:

```shell-session
$ sudo pacman --sync --refresh --needed chicken
```

But if we have .NET Mono installed (I had once because it was a dependency of some other package), then we can build and install CHICKEN Scheme manually and add it to the path in a way that takes precedence over Mono `csi` and `csc`.

```shell-session
$ mkdir -pv ~/local/build
$ cd !$

$ wget http://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz
$ tar xzvf chicken-5.4.0.tar.gz
$ cd chicken-5.4.0

$ make PREFIX=$HOME/local/chicken-5.4.0 -j$(nproc)
$ make PREFIX=$HOME/local/chicken-5.4.0 install

$ export PATH="$HOME/local/chicken-5.4.0/bin:$PATH"
```

Note we add the local chicken bin path first when exporting.
That’ll make sure that path is searched for first.

After the `make & make install` commands above, we should have the necessary tools available in `~/local/chicken-5.3.0` and its subdirectories:

```shell-session
$ tree -C ~/local/chicken-5.3.0/bin
/home/deveng/local/chicken-5.3.0/bin
├── chicken
├── chicken-do
├── chicken-install
├── chicken-profile
├── chicken-status
├── chicken-uninstall
├── csc
├── csi
└── feathers
```

Then let’s try a few commands to see things are working:

```shell-session
$ which csi
/home/deveng/local/chicken-5.3.0/bin/csi

$ which csc
/home/deveng/local/chicken-5.3.0/bin/csc

$ csc -help | head -n 4
Usage: csc [OPTION ...] [FILENAME ...]

  `csc' is a driver program for the CHICKEN compiler. Files given on the
  command line are translated, compiled or linked as needed.

$ csi
CHICKEN
(c) 2008-2021, The CHICKEN Team
(c) 2000-2007, Felix L. Winkelmann
Version 5.3.0 (rev e31bbee5)
linux-unix-gnu-x86-64 [ 64bit dload ptables ]

Type ,? for help.
; loading /home/deveng/.csirc ...
#;1> (+ 1 2 3 4 5)
15
```

Congrats! We are all set up and ready to code! 🎉

## General Tips

Search for identifiers on this page:

* [Cheecadee](https://api.call-cc.org/5/doc/)

## Other resources on CHICKEN Scheme

- [Why the name CHICKEN Scheme](https://mail.gnu.org/archive/html/chicken-users/2010-08/msg00044.html).
- https://en.wikipedia.org/wiki/Chicken_(Scheme_implementation)
- [What to expect from CHICKEN 6](https://www.more-magic.net/posts/chicken-6.html)

