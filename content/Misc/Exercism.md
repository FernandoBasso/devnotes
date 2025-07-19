---
tags:
  - exercism
  - programming-language
  - dsa
---
## Install on Linux

Go to the [Exercism releases page](https://github.com/exercism/cli/releases), copy the download URL for your architecture, set the `download_url` as shown below, and execute the other commands as well.

```bash
$ download_url='https download URL here'

$ mkdir -pv ~/bin/exercism

$ wget "$gzurl"  -O - | tar -C ~/bin/exercism -xzvf -

$ unset download_url
```

Then add something like this in `.bashrc`:

```bash
##
# https://exercism.org/cli-walkthrough
#
# Source the bash completions.
#
exercism_completion_path="$HOME/bin/exercism/shell/exercism_completion.bash"
[ -r "$exercism_completion_path" ] && source "$exercism_completion_path"

##
# Make `exercism` command available in the PATH.
#
export PATH="$PATH:$HOME/bin/exercism"
```

Open a new terminal session and verify that `exercism Tab Tab` shows the possible completion commands.

Then configure the auth token and the workspace:

```bash
$ exercism configure --token='my token'
- [ ] $ exercism configure --workspace="$HOME/source/exercism"
```

- https://exercism.org/cli-walkthrough