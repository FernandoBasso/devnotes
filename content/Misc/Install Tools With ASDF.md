---
tags:
  - programming-language
  - ruby
  - install
  - asdf
  - nodejs
  - go
---
## Intro

Follow [ASDF Getting Started](https://asdf-vm.com/guide/getting-started.html) first.

## Go

### Install Go on Ubuntu

Install Go and set it as a default for new shells:

```bash
$ asdf plugin add golang
$ asdf install golang 1.24.4
$ asdf set --home golang 1.24.4
```

## Node.js

### Install Node.js with asdf on Ubuntu

Install Node.js and set it as a default for new shells:

```bash
$ asdf plugin add nodejs
$ asdf list all nodejs
$ asdf install nodejs 24.3.0
$ asdf set --home nodejs 24.3.0
```

## Ruby
### Install Ruby with asdf on Ubuntu

Unpack the [asdf binary](https://github.com/asdf-vm/asdf/releases) into a directory on your path (I use `$HOME/bin/`).

Install the required dependencies:

```bash
$ sudo apt install --yes \
	zlib1g-dev \
	libffi-dev \
	libyaml-dev
```

Install ruby and set a default one for new shells:

```bash
$ asdf list all ruby
$ asdf install ruby 3.4.4
$ asdf set --home ruby 3.4.4
```

### Install ruby with asdf on macOS

```bash
$ brew install asdf
$ asdf plugin add ruby
$ asdf list all ruby
$ asdf install ruby 3.4.4
$ asdf set --home ruby 3.4.4
```

If we want to set some other version, like 3.3.3, then remove the 3.4.4 from `~/.tools-versions` first.
