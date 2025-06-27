---
tags:
  - gpg
  - gnupg
---
## Error screen or window too small
#gpg #gnupg #pinentry #gpg-agent

```
$ git commit -m 'My commit'

error: gpg failed to sign the data:
[GNUPG:] KEY_CONSIDERED BD0D7CFF3C1B7592CB9C625A0FC771A692376BA4 2
[GNUPG:] BEGIN_SIGNING H8
[GNUPG:] PINENTRY_LAUNCHED 11131 curses 1.3.1 /dev/ttys002 xterm-kitty - 20620/501/4 501/20 0
gpg: signing failed: Screen or window too small
[GNUPG:] FAILURE sign 83776381
gpg: signing failed: Screen or window too small

fatal: failed to write commit object
```

Solution was to install `pinentry` and kill the `gpg-agent`:

```bash
$ brew install pinentry
$ killall gpg-agent
$ git commit -m 'My commit'
(Success!)
```