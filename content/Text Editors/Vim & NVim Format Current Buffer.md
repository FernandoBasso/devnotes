---
tags:
  - nvim
  - format
  - gofmt
  - prettier
description: NVim examples on how to format the current buffer with tools and language formaters like prettier, gomft, etc.
---
### Format Go buffers with gofmt

Go provides the [gofmt](https://pkg.go.dev/cmd/gofmt) tool for formatting files:

**gofmt help**

```text
$ gofmt --help
usage: gofmt [flags] [path ...]
  -cpuprofile string
    	write cpu profile to this file
  -d	display diffs instead of rewriting files
  -e	report all errors (not just the first 10 on different lines)
  -l	list files whose formatting differs from gofmt's
  -r string
    	rewrite rule (e.g., 'a[b:len(a)] -> a[b:]')
  -s	simplify code
  -w	write result to (source) file instead of stdout
```

From vim or nvim, we can format the contents of the current buffer with this:

**vim cmdline**

```text
:!gofmt -w %
```

### Format JS/TS files buffers with prettier

JavaScript, TypeScript and .jsx/.tsx buffers can be formatted with [prettier](https://prettier.io/docs/en/editors).

Assuming we have node and npm available, we can format the current buffer with something like this:

**vim cmdline**

```text
:%!npx prettier --stdin-filepath %
```

Note the use of `%` at the beginning. It causes all lines in the buffer to be captured for formatting. The `%` at the end means something else. In this case, it expands the relative path of the current buffer, similar as if we do `:echo expand('%')`.

Comparing with the `gofmt` example above, it does not require the `%` at the beginning because `gofmt` behaves differently than `prettier`.

In any case, we can use specify a keymap for easily formatting a buffer at a whim:

**set vim keymap**

```text
nnoremap gpp :silent %!npx prettier --stdin-filepath %<CR>
```

**set nvim keymap from a .lua config file**

```text
vim.cmd [[
  nnoremap gpp :silent %!npx prettier --stdin-filepath %<CR>
]]
```

## Format with deno fmt

```text
:%!deno fmt %
```
