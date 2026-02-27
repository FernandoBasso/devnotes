---
tags:
  - git
  - cmdline
description: Notes and practical examples on inspecting and knowing stuff in a Git repository.
---
## Useful log commands

Logging the last five commits:

```shell
git log -5
git log -n 5
git log -n 5 --oneline
```

Show stat, diff, or both:

```shell
git log --stat
git log --patch
git log --patch-with-stat
```

List all branches containing a given commit:

## Useful branch commands


```shell
git branch --contains <commit>

# Also include remotes.
git branch --remotes --contains <commit>
```

https://stackoverflow.com/questions/1419623/how-to-list-branches-that-contain-a-given-commit

## Find commits containing a given pattern

In the current branch:

```shell
git log -S 'pattern'
```

In all commits and all branches:

```shell
git grep pattern $(git rev-list --all)
```