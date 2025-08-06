---
tags:
  - obsidian
  - bash
  - plugin
---
## Vim Resources
#vim #plugin

- [Obsidian for Vim Users](https://publish.obsidian.md/hub/04+-+Guides%2C+Workflows%2C+%26+Courses/for+Vim+users#for+Vim+users)
- https://github.com/replit/codemirror-vim
- https://obsidian.md/plugins?id=obsidian-vimrc-support
- https://github.com/esm7/obsidian-vimrc-support

## Editing Tips

We can type `[[`  to have the editor suggest files, and if Wikilinks are turned off, it will still convert the link to the other files to markdown.

![obisidian wikilinks off](obsidian-wikilinks-off.png)
## Git plugin

I use this date format:

```
ddd, MMM Do, YYYY, hh:mm
```

![obsidian git plugin commit date format](obsidian-git-plugin-commit-date-format.png.png)

The commit message is created like this:

> Save notes on Mon, Jun 16th, 2025, 08:52

## Sign commits with GPG
Created: 2025-06-27 10:27

#gpg #commit #git

Most of my repos include this as part of the git config:

```bash
$ git config --local user.name 'Fernando Basso'
$ git config --local user.email me@example.org
$ git config --local commit.gpgsign true
$ git config --local user.signkey my-gpg-key
```

On Arch Linux, the Git plugin for Obsidian worked out of the box. On macOS, I had to follow these instructions:

https://publish.obsidian.md/git-doc/Integration+with+other+tools#GPG+Signing

```bash
$ which gpg
/opt/homebrew/bin/gpg

$ git config --local gpg.program /opt/homebrew/bin/gpg
```

Could also be a single line like this:

```bash
$ git config --local gpg.program "$(which gpg)"
```

Check the resulting configuration with:

```
$ git config --list --local | grep gpg
commit.gpgsign=true
gpg.program=/opt/homebrew/bin/gpg
```

Or

```
$ grep gpg .git/config 
	gpgsign = true
[gpg]
	program = /opt/homebrew/bin/gpg
```

After this, committing from Obsidian Git plugin worked fine and with my GPG signature.

## Push to multiple remotes

Follow the steps described in [Push to multiple remotes at once](Git%20Remotes.md#Push%20to%20multiple%20remotes%20at%20once).

## The End

![bash-intro-command-line-help-null](bash-intro-command-line-help-null.png)

## Search and Replace

### Tabs

As of 2025, looks like Obsidian search and replace does _not_ support regular expressions. Therefore, we cannot search for `\t` and replace with two or four empty spaces.

What we can do, however, is to search by the ASCII or Unicode codepoint for tab: `0009`. On your operating system, figure out how to input Unicode code points, search for the tab codepoint, and replace with whatever you need.

See [Unicode & UTF-8](Unicode%20&%20UTF-8.md).

## Dictionary words

When I add a word to the dictionary, where is it stored? It it be backed up to migrate to a new machine?

Yes, the added words are stored in the global Obsidian dictionary. On Linux, it is:

```text
$HOME/.config/obsidian/Custom Dictionary.txt
```

On macOS, probably inside this directory:

```text
$HOME/Library/Application Support/obsidian/
```

And on Windows it seems to be on:

```text
%APPDATA%\Obsidian\
```
