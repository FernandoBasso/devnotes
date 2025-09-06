---
tags:
  - linux
  - grub
  - arch-linux
description: Notes, tips and examples on installing and configuring GRUB on Arch Linux.
---
## Grub update 2025-09-06

Arch Linux grub update:

```text
$ pacman --sync --refresh --sysupgrade

...
(23/60) upgrading grub                                                                                  [#############################################################] 100%
:: To use the new features provided in this GRUB update, it is recommended
   to install it to the MBR or UEFI. Due to potential configuration
   incompatibilities, it is advised to run both, installation and generation
   of configuration:
     # grub-install ...
     # grub-mkconfig -o /boot/grub/grub.cfg
New optional dependencies for grub
    libusb: For grub-emu USB support [installed]
    sdl: For grub-emu SDL support [installed]
(24/60) upgrading vim-runtime
...
```

![EFI mount point on my personal Arch Linux desktop machine](EFI-mount-point-arch-linux-personal-desktop-2025-09-06.png)

- https://wiki.archlinux.org/title/EFI_system_partition#Mount_the_partition
- https://wiki.archlinux.org/title/GRUB#Installation

Run:

Mount root partition to `/mnt`, then mount EFI special partition to `/mnt/boot` before running `arch-chroot /mnt`.

```text
$ sudo grub-install \
    --target=x86_64-efi \
    --efi-directory=/boot \
    --bootloader-id=ARCHLINUX

[sudo] password for devy: 
Installing for x86_64-efi platform.
Installation finished. No error reported.
```

- https://wiki.archlinux.org/title/GRUB#Generated_grub.cfg

```text
$ sudo grub-mkconfig -o /boot/grub/grub.cfg

Generating grub configuration file ...
Found linux image: /boot/vmlinuz-linux
Found initrd image: /boot/amd-ucode.img /boot/initramfs-linux.img
Found fallback initrd image(s) in /boot:  amd-ucode.img initramfs-linux-fallback.img

Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.

Adding boot menu entry for UEFI Firmware Settings ...
done
```

## Lukus & cryptosetup

```text
$ lsblk 
NAME        MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda           8:0    0 931.5G  0 disk  
├─sda1        8:1    0   100M  0 part  
├─sda2        8:2    0 488.2G  0 part  
└─sda3        8:3    0 443.2G  0 part  
zram0       252:0    0     4G  0 disk  [SWAP]
nvme0n1     259:0    0 953.9G  0 disk  
├─nvme0n1p1 259:1    0     1G  0 part  /boot
├─nvme0n1p2 259:2    0  89.4G  0 part  
│ └─root    253:0    0  89.4G  0 crypt /
└─nvme0n1p3 259:3    0 863.5G  0 part  
  └─home    253:1    0 863.4G  0 crypt /home
```


Mount encrypted partition:

```text
$ sudo cryptosetup luksOpen /dev/nvme0n1p1 mycryptoroot
$ sudo mount /dev/mapper/mycruptoroot /mnt
```
