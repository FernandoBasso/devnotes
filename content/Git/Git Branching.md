---
tags:
  - git
  - branch
  - cmdline
---
## Git Branching

### git checkout -b

> [!NOTE] remote name
> In these examples, the remote is named `gl` because I use Gitlab a lot and name my Gitlab remote repos as `gl` instead of the default `origin`.

We all use `git checkout -b new-branch` to create a new branch from time to time.
Generally, we first switch to `main` or `develop`, update it and then from there create the new branch:

```text
$ git checkout main
$ git fetch main
$ git reset --hard gl/main
$ git checkout -b new-branch
```

If you now do:

```text
$ git branch -vv | grep new-branch
* my-branch      123aaa9 The commit message here
```

That includes no tracking branch information.

But we can also use `-b` to create a branch from some other branch (instead of from the one we currently are):

```text
$ git fetch gl main
$ git checkout -b other-branch gl/main

$ git branch -vv | grep other-branch
branch 'other-branch' set up to track 'gl/main'.
Switched to a new branch 'other-branch'

$ git branch -vv | grep other-branch
* other-branch      bfc8d31 [gl/main] The commit message here
```

Specially note the bit “branch `other-branch` set up to track `gl/main`“. This is significant. It means if you now push without specifying which branch to push to, it will send changes to `main` (which could be catastrophic in the CI/CD era where a git push may trigger a deploy to production).

It can be fixed by setting it a new upstream to a remote branch with the same name as the local branch:

```text
$ git push origin --set-upstream other-branch:other-branch
 ... some output omitted for brevity ...
 * [new branch]      other-branch -> other-branch
branch 'other-branch' set up to track 'gl/other-branch'.
```

As it can be seen, it sets the local `other-branch` to track the remote `other-branch`.

It is possible to use `--no-track` to create a branch from another branch, which is probably a safer approach than mistakenly create a branch that tracks `main` and then _fix_ it in a subsequent command, as we did above.
We could do this instead:

```text
$ git checkout -b other-branch --no-track gl/main
Switched to a new branch 'other-branch'

$ git branch -vv | grep other-branch
* other-branch     bfc8d31 The commit message here
```

Note it just says “Switched to a new branch `other-branch`” without any mentions to making it track some other branch.

## Branch with same name as directory or file

```text
~/work/src/studies/devhowto/devnotes [drafts|u+1]
$ git fetch gl
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (18/18), done.
remote: Total 20 (delta 11), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (20/20), 8.79 KiB | 428.00 KiB/s, done.
From gitlab-fernandobasso_devel:devhowto/devnotes
   dbb9446..7f122ba  drafts     -> gl/drafts
 * [new branch]      adocwiki   -> gl/adocwiki
   57a79d7..0a6a9ff  main       -> gl/main
```

And then I decide to switch to the branch `adocwiki`:

```shell-session
~/work/src/studies/devhowto/devnotes [drafts|u+1]
$ git checkout adocwiki
fatal: 'adocwiki' could be both a local file and a tracking branch.
Please use -- (and optionally --no-guess) to disambiguate
```

Because I have a directory name `adocwiki` on current directory, git is unsure what I really want to do (because `checkout` command has different uses). Neither worked:

```shell-session
~/work/src/studies/devhowto/devnotes [drafts|u+1]
$ git checkout -- adocwiki

~/work/src/studies/devhowto/devnotes [drafts|u+1]
$ git checkout --no-guess -- adocwiki

~/work/src/studies/devhowto/devnotes [drafts|u+1]
```

I was still on the original `drafts` branch. Using the somewhat newer `switch` command worked, though:

```text
~/work/src/studies/devhowto/devnotes [drafts|u+1]
$ git switch adocwiki
branch 'adocwiki' set up to track 'gl/adocwiki'.
Switched to a new branch 'adocwiki'

~/work/src/studies/devhowto/devnotes [adocwiki|u=]
```
