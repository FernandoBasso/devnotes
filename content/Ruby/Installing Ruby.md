---
tags:
  - programming-language
  - ruby
  - install
---
## Install ruby with asdf on macOS

Follow [ASDF Getting Started](https://asdf-vm.com/guide/getting-started.html) first.

```
$ brew install asdf
$ asdf plugin add ruby
$ asdf list all ruby
$ asdf install ruby 3.4.4
$ asdf set --home ruby 3.4.4
```

If we want to set some other version, like 3.3.3, then remove the 3.4.4 from `~/.tools-versions` first.

