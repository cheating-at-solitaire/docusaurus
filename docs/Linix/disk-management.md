---
title: Linux Disk Management
sidebar_position: 5
---

# Linux Disk Management

Commands for checking disks, partitions, filesystems and storage usage.

## View disk usage

```bash
df -h
```

Show filesystem types:

```bash
df -Th
```

## Check directory sizes

```bash
du -sh ~/projects
```

Check subdirectories:

```bash
du -h --max-depth=1 ~
```

## List disks and partitions

```bash
lsblk
```

Include filesystem details:

```bash
lsblk -f
```

## View partition information

```bash
sudo fdisk -l
```

This is a read-only listing command.

## Check inode usage

```bash
df -i
```

A filesystem can run out of inodes even when free disk space remains.

## Find large files

Search your home directory:

```bash
find ~ -type f -size +500M
```

## Check available memory and swap

```bash
free -h
swapon --show
```

## Check filesystem UUIDs

```bash
sudo blkid
```

## Check disk health

On a full Linux system with supported physical disks, install smartmontools:

```bash
sudo apt install smartmontools
```

Example:

```bash
sudo smartctl -a /dev/sdX
```

Replace `/dev/sdX` with the correct device.

SMART information may not be available inside WSL2 or a virtual machine.

## Disk management safety

Before changing partitions or filesystems:

1. Confirm the correct device using `lsblk`.
2. Back up important data.
3. Check whether the filesystem is mounted.
4. Understand whether the operation is destructive.

:::danger
Commands such as `mkfs`, partition deletion and disk formatting can permanently destroy data. Never run them against a device containing files you want to keep.
:::

## WSL storage

In WSL2, the Linux root filesystem is commonly stored in a virtual disk managed by Windows.

Check your Linux filesystem:

```bash
df -h /
```

Windows drives are typically available through paths such as `/mnt/c`.

Avoid running partitioning or formatting commands against WSL-managed virtual disks unless you have a specific recovery or maintenance procedure.
EOF

