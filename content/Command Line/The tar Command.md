---
tags:
  - cmdline
  - tar
---
## Pack Excluding Directories

Useful command to create an archive of a React/Vue.js where we want avoid including `node_modules` and `dist` directories:

```bash
$ tar \
    --exclude './myapp-poc1/node_modules' \
    --exclude './myapp-poc1/dist' \
    -cf myapp-poc1.tar \
    ./myapp-poc1

$ du -h myapp-poc1.tar
800K	myapp-poc1.tar
```


## Download with wget to STDIN and untar 
#tar #stdin #stdout

Download with `wget`, output to STDIN, and feed that to `tar` (tar reads from STDIN, not from a file on disk) for unpacking:

```bash
$ wget \
    https://example.org/downloads/file.tar.gz \
    -O - \
    | tar -xzvf -
```

The option `-O -` is the same as `--output-document=-`. It means “dump to STDOUT” (instead of to a file on disk).

Then we use `tar` with these options:

- `-x`: extract the archive.
- `-z`: using `gzip`.
- `-v`: verbose.
- `-f`: “read from _this_ file”. In this case, `-` which means STDIN.

## Download with wget to STDIN and un-tar to a specific directory
#tar #stdin #stdout #directory

```bash
$ mkdir -pv ~/Public/thing

$ wget \
    https://example.org/downloads/thing.tar.gz \
    -O - \
    | tar -xzvf - -C ~/Public/thing
```

The `wget` command downloads a `.tar.gz` file and dumps it to STDIN. That result is then piped to `tar`, that reads the STDIN and un-tar the contents.

The `-C ~/Public/thing` means ”change directory to `$HOME/Public/thing`, so that the contents will be extracted to that directory. It requires that the directory already exists.
