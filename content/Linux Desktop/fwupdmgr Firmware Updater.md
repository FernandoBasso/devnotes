---
tags:
  - linux
  - firmware
  - update
description: Notes and examples on using fwupdmgr to handle firmware updates on Linux.
---

## Basic commands

List devices:

```text
$ sudo fwupdmgr get-devices

$ sudo fwupdmgr get-devices --json | jq
```

Check for available updates:

```text
$ sudo fwupdmgr get-updates
Devices with no available firmware updates: 
 • MSI SHIP OWN CA
 • KEK CA
 • Option ROM UEFI CA
 • SA400S37480G
 • Windows Production PCA
 • XPG GAMMIX S11 Pro
Devices with the latest available firmware version:
 • UEFI CA
 • UEFI dbx
No updates available
```

Update firmware:

```text
$ sudo fwupdmgr update
```
