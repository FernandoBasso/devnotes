---
tags:
  - git
  - remote
description: Notes and examples on working with Git remotes.
---
## Push to multiple remotes sequentially

Suppose we have the remotes `gh` and `gl`. To push to both, we would do something like this:

```bash
$ git push gh HEAD
$ git push gl HEAD
```

But it is possible to create a pseudo-remote (here named “myrepos”) that “points to” those real remotes:

```bash
$ git remote add myrepos \
    git@gitlab.com/example/repo.git

$ git remote set-url myrepos --add \
    git@github.com/example/repo.git
```

We then set the pseudo-remote “myrepos” as the default target by pushing with these options:

```bash
git push --set-upstream myrepos HEAD
```

`HEAD` is the current branch. It could be `devel`, `main` or any other branch we want to push and track. It will sequentially push the refs to those two remotes.

From now on (unless a new default target is set), a simple `git push myrepos HEAD` will push the commits of the current branch to both `gh` and `gl` remotes.