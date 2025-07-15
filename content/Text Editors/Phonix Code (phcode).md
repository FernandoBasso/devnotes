---
tags:
  - text-editor
  - phcode
---
## GBM Buffer Invalid Argument

```text
$ phcode .
Appdata path is /home/devy/.local/share/io.phcode
Failed to create GBM buffer of size 1366x900: Invalid argument
```

Then the editor would just show the window frame without any buttons or UI at all. Was able to get it working with this:

```bash
WEBKIT_DISABLE_DMABUF_RENDERER=1 phcode .
```

I wrote an additional answer here:
- https://github.com/orgs/phcode-dev/discussions/1938