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

And it is possible to link to specific headings within a document. Type `[[`, let the completion show up, select the document, and then type `#` to let the heading completion kick in.

> [!TIP] Rename documents and headings
>
> Links and references are updated automatically if we use Obsidian “Rename” and Rename (document) or “Rename this heading” facilities. So remember to renamed documents and headings with those instead of simply manually editing the text.

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

Then install `pinentry-mac`, and set it to `~/.gnupg/gpg-agent.conf`:

```text
echo $(brew --prefix)/bin/pinentry-mac >> ~/.gnupg/gpg-agent
/opt/homebrew/bin/pinentry-mac

killall gpg-agent
```

It may also be necessary to set “Additional environment variables” in the Git plugin and set it to something like:

```text
GNUPGHOME=/Users/your-user/.gnupg
```

Quit and reopen Obsidian. After this, committing from Obsidian Git plugin worked fine and with my GPG signature.

> [!NOTE] Commit from the terminal once
> One time it only worked after I did a commit from the terminal first.

## Push to multiple remotes

Follow the steps described in [Push to multiple remotes sequentially](Git%20Remotes.md#Push%20to%20multiple%20remotes%20sequentially). After that is done, the next time we push from the Obsidian Git plugin, it will honor the default target we set and the push will be performed in the multiple remotes that have been set. 

## Templater plugin

After installing Templater, open Obsidian Hotkeys settings and set a key binding for “Templater: Open insert template modal”:


![Obsidian Templater plugin Shortcut Settings](obisidan-templater-shortcuts-settings-2025-08-13.png)

In this case it was set to `Opt + e`. I set it to `Alt + e` on Linux.

And remember to tick Automatic jump to cursor in the Templater settings:

![Obsidian Templater plugin automatic jump to cursor setting](obsidian-templater-automatic-jump-to-cursor-setting.png)

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
