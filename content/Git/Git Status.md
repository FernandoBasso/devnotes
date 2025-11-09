---
tags:
  - git
  - status
  - config
description: Notes and examples on git status usage and configuration.
---
## Show untracked files

By default, `git status` does not show new files in subdirectories, but just the directory name itself.

```text
status.showUntrackedFiles
    By default, git-status(1) and git-commit(1) show files which are not
    currently tracked by Git. Directories which contain only untracked
    files, are shown with the directory name only. Showing untracked
    files means that Git needs to lstat() all the files in the whole
    repository, which might be slow on some systems. So, this variable
    controls how the commands display the untracked files. Possible
    values are:

    •   no - Show no untracked files.
    •   normal - Show untracked files and directories.
    •   all - Show also individual files in untracked directories.

    If this variable is not specified, it defaults to normal. All usual
    spellings for Boolean value true are taken as normal and false as
    no. This variable can be overridden with the -u|--untracked-files
    option of git-status(1) and git-commit(1).
```

Therefore, if we want to list all new files in subdirectories, this git config will do it:

```text
$ git config --local status.showUntrackedFiles all
```

> [!TIP] --global or --local
> The option `--global` applies to all repos for the current user. Use `--local` to configure per repo, or to override the global config for a given repo.
 