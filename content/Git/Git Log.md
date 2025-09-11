---
tags:
  - git
  - log
  - author
  - regex
  - cmdline
  - perl
description: Concepts, tips and examples on git log command.
---
## Commits not by given author

Sometimes we want to inspect the git commit logs but ignore commits made by a specific user, for instance, some bot that bumps dependencies or similar things.

Log except commits by a given author:

```text
$ git log \
    -20 \
    --no-merges \
    --perl-regexp \
    --author='^((?!dependabot))'
```

It works with a negative lookahead Perl-style regexp.
