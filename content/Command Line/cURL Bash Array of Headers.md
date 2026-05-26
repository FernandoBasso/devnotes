---
tags:
  - curl
  - bash
  - shell
  - cmdline
description: Examples of how to use bash arrays to compose curl parameters and HTTP headers.
---
## Example 1

Imagine we have a `get_page.sh` file with this bash code:

```bash
#!/usr/bin/env bash

declare -A headers
headers[Accept]='text/html'
headers[Content-Type]='text/html'

args=()

for key in "${!headers[@]}"
do
	args+=( -H "$key: ${headers[$key]}")
done

curl -s "${args[@]}" https://example.com
```

First, we create an associative array where each header is the key, and the header value is the array value for that key. Then, we iterate over the array to get the keys, and then add a valid header string to `args` with `( -H "...")`.

Finally, call `curl` with the silent flag and expanding `args` so they become valid curl arguments.

> [!TIP] Inspect the array
>
> One can always inspect an array by using the builtin `declare`: `declare -p my_array`. `help declare` for more info.
>
> Or, to see exactly what the array will expand to when passed as argument to curl, use a simple `echo`: `echo "${args[@]}"`. `printf `%q\n' "${args[@]}" is a good option too.

We could add `declare -p args` right after the loop to inspect `args`. The output is something like this:

```text
declare -a args=([0]="-H" [1]="Content-Type: text/html" [2]="-H" [3]="Accept: text/html")
```

Or `echo ${args[@]}`, giving the result:

```text
-H Content-Type: text/html -H Accept: text/html
```

And `printf '%q\n' "${args[@]}":

```text
-H
Content-Type:\ text/html
-H
Accept:\ text/html
```

The way it prints on the terminal may feel like the `-H ...` is not properly quoted, but it is the way we've built `args` and the way we expanded it to be passed to curl is correct and works perfectly.

