---
tags:
  - arch-linux
  - iso
  - install
  - usb
  - live
description: Notes and tips on the Arch Linux ISO and install notes.
---
## Intro

These are my own, personal notes.
They are mostly based on the instructions on [download page](https://archlinux.org/download/) and the many links on the [installation guide]({https://wiki.archlinux.org/title/Installation_guide).
Don’t blindly follow these notes, but also check the official docs and notes on that page.

You may also check the [official installation guide](https://wiki.archlinux.org/title/Installation_guide).

These steps were tested on a working Arch Linux installation, but they should work from other distributions as well.

## Download

Open `download_archlinux.sh` and update the `base_url`.

**download_archlinux.sh**

```bash
#!/usr/bin/env bash

url='https://mirrors.edge.kernel.org/archlinux/iso/2026.01.01'

files=(
  b2sums.txt
  sha256sums.txt
  archlinux-x86_64.iso.sig
  archlinux-x86_64.iso
)

for file in "${files[@]}"
do
  printf -v url '%s/%s' "$url" "$file"
  wget "$url"
done

2> /dev/null \
    b2sum --check ./b2sums.txt \
    | grep archlinux-x86_64.iso \
    &&
```

Then:

```shell-session
$ bash ./download_archlinux.sh
```

## Verify Image Checksum

```shell-session
$ 2> /dev/null \
    b2sum --check ./b2sums.txt | \
    grep archlinux-x86_64.iso
archlinux-x86_64.iso: OK
```

## Verify signature

```shell-session
$ pacman-key --verify ./archlinux-x86_64.iso.sig
==> Checking ./archlinux-x86_64.iso.sig... (detached)
gpg: Signature made Fri 01 Sep 2023 07:48:49 AM -03
gpg:                using EDDSA key 3E80CA1A8B89F69CBA57D98A76A5EF9054449A5C
gpg:                issuer "pierre@archlinux.org"
gpg: Good signature from "Pierre Schmitz <pierre@archlinux.org>" [full]
gpg:                 aka "Pierre Schmitz <pierre@archlinux.de>" [unknown]
```

It says “Good sinature”.

Install `sequoia-sq`:

```shell-session
$ sudo pacman --sync --refresh sequoia-sq --needed
```

Download signing key for the user who signed the image:

```shell-session
$ sq network wkd get pierre@archlinux.org -o release-key.pgp
(no output)
```

There should be a new `release-key.gpg` file in the current directory:

```shell-session
$ tree -C .
.
├── archlinux-x86_64.iso
├── archlinux-x86_64.iso.sig
├── b2sums.txt
├── download_archlinux.sh
├── README.adoc
├── release-key.pgp
└── sha256sums.txt

1 directory, 7 files
```

```shell-session
$ sq verify \
    --signer-file ./release-key.pgp \
    --detached \
    ./archlinux-x86_64.iso.sig \
    ./archlinux-x86_64.iso
Good signature from 76A5EF9054449A5C ("Pierre Schmitz <pierre@archlinux.org>")

1 good signature.
```

## Single script



```bash
#!/usr/bin/env bash

set -euo pipefail

##
# E.g.:
# https://mirrors.edge.kernel.org/archlinux/iso/2026.01.01
#
readonly base_url="$1"

readonly -a files=(
  b2sums.txt
  sha256sums.txt
  archlinux-x86_64.iso.sig
  archlinux-x86_64.iso
)

##
# Download the files.
#
for file in "${files[@]}"
do
  printf -v url '%s/%s' "$base_url" "$file"
  wget -N "$url"
done

##
# Only keep the sum for archlinux-x86_64.iso.
#
sed -i '/archlinux-x86_64\.iso/!d' ./b2sums.txt

##
# Verify the checsum of the ISO.
#
2> /dev/null b2sum --check ./b2sums.txt
#
# Should print something like:
#
#   archlinux-x86_64.iso: OK
##

##
# Download the PGP signature release key.
#
sq network wkd \
  search pierre@archlinux.org \
  --overwrite \
  --output ./archlinux-release-key.pgp

##
# Verify the signature.
#
sq verify \
  --signer-file ./archlinux-release-key.pgp \
  --signature-file ./archlinux-x86_64.iso.sig \
  ./archlinux-x86_64.iso

#
# Should print something like this in the end:
#
#   1 authenticated signature.
#
# And `echo $?` should output 0, meaning everything worked
# as expected and the ISO is correctly downloaded and
# verified, ready to be writen to DVD or USB stick.
#
```


## Write to USB flash drive

> [!WARN]
>
> The following steps will irrevocably delete any existing data on the USB device.


Make sure the device is not mounted. Run something like:

```shell-session
$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda            8:0    0 931.5G  0 disk
├─sda1         8:1    0   100M  0 part
├─sda2         8:2    0 488.2G  0 part
└─sda3         8:3    0 443.2G  0 part
sdb            8:16   0 931.5G  0 disk
├─sdb1         8:17   0 371.1G  0 part  /run/media/fernando/SG1W370GB
└─sdb2         8:18   0 560.4G  0 part  /run/media/fernando/SG1L560GB

# ①
sdc            8:32   1   7.3G  0 disk
├─sdc1         8:33   1   803M  0 part  /run/media/fernando/ARCH_202212
└─sdc2         8:34   1    15M  0 part

nvme0n1      259:0    0 953.9G  0 disk
├─nvme0n1p1  259:1    0   300M  0 part  /boot
├─nvme0n1p2  259:2    0  47.7G  0 part  /
└─nvme0n1p3  259:3    0 905.9G  0 part
  └─homedirs 254:0    0 905.9G  0 crypt /home
```

1. In my case, `sdc` is my USB device.
Note `sdc1` it is mounted at `/run/media/fernando/ARCH_202212`.

We can umount it with:

```shell-session
$ umount /dev/sdc1
(no output)
```

And we can verify it is not mounted any longer:

```shell-session
$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda            8:0    0 931.5G  0 disk
├─sda1         8:1    0   100M  0 part
├─sda2         8:2    0 488.2G  0 part
└─sda3         8:3    0 443.2G  0 part
sdb            8:16   0 931.5G  0 disk
├─sdb1         8:17   0 371.1G  0 part  /run/media/fernando/SG1W370GB
└─sdb2         8:18   0 560.4G  0 part  /run/media/fernando/SG1L560GB

sdc            8:32   1   7.3G  0 disk  # ①
├─sdc1         8:33   1   803M  0 part
└─sdc2         8:34   1    15M  0 part

nvme0n1      259:0    0 953.9G  0 disk
├─nvme0n1p1  259:1    0   300M  0 part  /boot
├─nvme0n1p2  259:2    0  47.7G  0 part  /
└─nvme0n1p3  259:3    0 905.9G  0 part
  └─homedirs 254:0    0 905.9G  0 crypt /home
```

1. It doesn’t show as mounted anywhere.

Check the name of your USB flash device:

```shell-session
$ ls -1 /dev/disk/by-id/usb-*
/dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0@
/dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0-part1@
/dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0-part2@
/dev/disk/by-id/usb-Seagate_Expansion_NA8ZZ0Q1-0:0@
/dev/disk/by-id/usb-Seagate_Expansion_NA8ZZ0Q1-0:0-part1@
/dev/disk/by-id/usb-Seagate_Expansion_NA8ZZ0Q1-0:0-part2@

$ ls -l /dev/disk/by-id/usb-*
lrwxrwxrwx 1 root root  9 Sep 14 07:46 /dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0 -> ../../sdc
lrwxrwxrwx 1 root root 10 Sep 14 08:05 /dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0-part1 -> ../../sdc1
lrwxrwxrwx 1 root root 10 Sep 14 08:05 /dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0-part2 -> ../../sdc2
lrwxrwxrwx 1 root root  9 Sep 13 21:46 /dev/disk/by-id/usb-Seagate_Expansion_NA8ZZ0Q1-0:0 -> ../../sdb
lrwxrwxrwx 1 root root 10 Sep 13 21:46 /dev/disk/by-id/usb-Seagate_Expansion_NA8ZZ0Q1-0:0-part1 -> ../../sdb1
lrwxrwxrwx 1 root root 10 Sep 13 21:46 /dev/disk/by-id/usb-Seagate_Expansion_NA8ZZ0Q1-0:0-part2 -> ../../sdb2
```

In my case, ``/dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0`` is the device I use (of this writing) for this purpose.

> [!WARN]
>
> Be **extremely** careful not to run the following command on a wrong device. Data will be irreversibly lost on the target device.
>
> Better a little caution than a great regret.
>
> YOU HAVE BEEN WARNED.

Finally, write the ISO to that device. Do not append the partition number.
That is, do not add the **1** in ``sdc***1****`` or *-part1** in ``usb-Generic_Flash_Disk_A0CB604F-0:0***-part1***``.
```shell-session
$ sudo dd \
    bs=4M \
    if=./archlinux-x86_64.iso \
    of=/dev/disk/by-id/usb-Generic_Flash_Disk_A0CB604F-0:0 \
    conv=fsync \
    oflag=direct \
    status=progress

[sudo] password for fernando:
843055104 bytes (843 MB, 804 MiB) copied, 84 s,
10.0 MB/s843395072 bytes (843 MB, 804 MiB) copied, 84.257 s, 10.0 MB/s

201+1 records in
201+1 records out
843395072 bytes (843 MB, 804 MiB) copied, 84.288 s, 10.0 MB/s
```

Check [USB flash installation on Arch Wiki](https://wiki.archlinux.org/title/USB_flash_installation_medium) for extra info.

The device should now have the new Arch Linux live ISO burned into the USB flash drive:

```shell-session
$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda            8:0    0 931.5G  0 disk
├─sda1         8:1    0   100M  0 part
├─sda2         8:2    0 488.2G  0 part
└─sda3         8:3    0 443.2G  0 part
sdb            8:16   0 931.5G  0 disk
├─sdb1         8:17   0 371.1G  0 part  /run/media/fernando/SG1W370GB
└─sdb2         8:18   0 560.4G  0 part  /run/media/fernando/SG1L560GB

# ①
sdc            8:32   1   7.3G  0 disk
├─sdc1         8:33   1   789M  0 part  /run/media/fernando/ARCH_202309
└─sdc2         8:34   1    15M  0 part

nvme0n1      259:0    0 953.9G  0 disk
├─nvme0n1p1  259:1    0   300M  0 part  /boot
├─nvme0n1p2  259:2    0  47.7G  0 part  /
└─nvme0n1p3  259:3    0 905.9G  0 part
  └─homedirs 254:0    0 905.9G  0 crypt /home
```

1. Note we earlier had ARCH_202212 and we now have ARCH_202309.

The USB flash device should now be usable as a live Arch Linux image.

> [!NOTE]
>
> On my Arch Linux setup, after the `dd` command finishes executing, the file manager (Thunar, from Xfce4) mounts it automatically. That may not be the case for your setup.
