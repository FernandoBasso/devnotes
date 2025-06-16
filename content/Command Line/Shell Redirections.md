---
tags:
  - bash
  - cmdline
  - redirection
---
## cat STDIN and redirect to file

```bash
$ 1> ./out.txt cat << EOF
foo
bar
EOF
```
