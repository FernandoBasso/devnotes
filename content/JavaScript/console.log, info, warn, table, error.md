---
tags:
  - javascript
  - log
  - warn
  - info
  - error
  - table
description: Some notes on log, info, warn, table, and error in JavaScript
---
# Handy, shorter “aliases”

Sometimes it becomes boring and annoying to have to do the “console.fn>” when debugging or trying to understand some code. So sometimes I use these aliases:

```javascript
const log = console.log.bind(console);
const info = console.info.bind(console);
const warn = console.warn.bind(console);
const err = console.error.bind(console);
const tbl = console.table.bind(console);
```

These work fine with TypeScript types, but we can also add explicit type annotations:

```typescript
const log: Console["log"] = console.log.bind(console);
const info: Console["log"] = console.info.bind(console);
const warn: Console["log"] = console.warn.bind(console);
const err: Console["log"] = console.error.bind(console);
const tbl: Console["log"] = console.table.bind(console);
```

And they type-check correctly on these versions of TypeScript and Deno as of 2026:

```text
$ tsc --version
Version 5.9.3

$ deno --version
deno 2.8.3 (stable, release, x86_64-unknown-linux-gnu)
v8 14.9.207.2-rusty
typescript 6.0.3

$ tsc --noEmit ./main.ts

$ echo $?
0

$ deno check ./main.ts

$ echo $?
0
```


And we use them like this:

```typescript
log(42);
tbl([10, 20, 30]);
```

Which outputs:

```text
$ deno run --check ./main.ts
Check main.ts
42
┌───────┬────────┐
│ (idx) │ Values │
├───────┼────────┤
│     0 │ 10     │
│     1 │ 20     │
│     2 │ 30     │
└───────┴────────┘
```
