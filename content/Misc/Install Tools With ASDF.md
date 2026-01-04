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

> [!NOTE] A note on dependencies
>
> Sometimes, especially if a tool needs to be compiled (instead of downloading a ready-to-use binary), it is necessary to install one ore more dependencies. These dependencies may or may not be already installed on your system.
>
>Therefore, when we mention dependencies that need to be installed, it doesn't mean your system doesn't already have them installed. On the opposite side, your system may be missing dependencies not mentioned here. In case of problems or errors, take a look at the logs install whatever is necessary to successfully installing and using your tools.
 
> [!WARNING] Versions
> The versions used as examples in this pages are just _examples_. Make sure to install the versions you want or need.
## Go

### Install Go on Linux

Install Go and set it as a default for new shells:

```bash
$ asdf plugin add golang
$ asdf install golang 1.24.4
$ asdf set --home golang 1.24.4
```

## Node.js

### Install Node.js with asdf on Linux

Install Node.js and set it as a default for new shells:

```bash
$ asdf plugin add nodejs
$ asdf list all nodejs

$ asdf install nodejs 24.3.0
$ asdf set --home nodejs 24.3.0
```

Or, for the latest version:

```bash
$ asdf install nodejs latest
$ asdf set --home nodejs latest
```

## Deno

```shell
asdf plugin add deno

asdf install deno latest

##
# Set as the default version of Deno globally for your user.
#
asdf set --home deno latest

##
# Or set the default version of deno for the current project only.
#
asdf set deno latest
```

## Ruby
### Install Ruby with asdf on Linux

Unpack the [asdf binary](https://github.com/asdf-vm/asdf/releases) into a directory on your path (I use `$HOME/bin/`).

Install the required dependencies on Ubuntu (on Arch Linux, the `base-devel` package was enough,):

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

## Haskell & Stack

```
$ asdf plugin add haskell
$ asdf list all haskell
$ asdf install haskell 9.12.2
$ asdf set --home haskell 9.12.2

$ asdf plugin add stack
$ asdf install stack latest
$ asdf set --home stack latest
```

## Clojure, clj, lein, clj-kondo
#clojure #clj #lein #leiningen

```bash
$ asdf plugin add clojure
$ asdf list all clojure
$ asdf install clojure latest
$ asdf set --home clojure latest
```

We should now have `clj` command available.

```bash
$ asdf plugin add leiningen
$ asdf list all lainingen
$ asdf install leiningen latest
$ asdf set --home leiningen latest
```

We should now have `lein` command available. Try `lein repl`.

```bash
$ asdf plugin add clj-kondo
$ asdf list all clj-kondo
$ asdf install clj-kondo latest
$ asdf set --home clj-kondo latest
```

## Install several tools with a loop

Some may have to be compiled and could take several minutes to complete.

```text
for lang in golang \
  nodejs \
  ruby \
  haskell \
  stack
do
  asdf plugin add "$lang"
  asdf install "$lang" latest
  asdf set --home "$lang" latest
done
```
