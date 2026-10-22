---
title: Linux Mounting and Filesystems
sidebar_position: 6
---

# Linux Mounting and Filesystems

Mounting makes a filesystem accessible at a directory called a mount point.

## View mounted filesystems

```bash
findmnt
```

Check a particular path:

```bash
findmnt /
```

## View filesystem types

```bash
lsblk -f
```

## Create a mount point

```bash
sudo mkdir -p /mnt/data
```

## Mount a filesystem

Example for a known, formatted Linux partition:

```bash
sudo mount /dev/sdX1 /mnt/data
```

Replace `/dev/sdX1` with the correct partition identified using `lsblk -f`.

Do not run this example against an unknown device.

## Verify the mount

```bash
findmnt /mnt/data
df -h /mnt/data
```

## Unmount a filesystem

```bash
sudo umount /mnt/data
```

If the filesystem is busy, check processes using it:

```bash
sudo fuser -vm /mnt/data
```

Close applications or shells using the filesystem before retrying.

## Temporary test mount

You can practise mounting without touching a physical disk using a tmpfs filesystem:

```bash
sudo mkdir -p /mnt/linux-demo
sudo mount -t tmpfs -o size=64M tmpfs /mnt/linux-demo
```

Create a test file:

```bash
echo "Linux mounting test" | sudo tee /mnt/linux-demo/test.txt
```

Verify:

```bash
findmnt /mnt/linux-demo
cat /mnt/linux-demo/test.txt
```

Unmount:

```bash
sudo umount /mnt/linux-demo
```

The test file disappears because tmpfs is temporary storage.

## Persistent mounts with fstab

The `/etc/fstab` file defines filesystems that can be mounted automatically.

View it:

```bash
cat /etc/fstab
```

Example entry for an existing ext4 filesystem:

```text
UUID=YOUR-UUID /mnt/data ext4 defaults,nofail 0 2
```

Find UUIDs:

```bash
sudo blkid
```

Before editing:

```bash
sudo cp /etc/fstab /etc/fstab.backup
```

After editing, validate the configuration:

```bash
sudo findmnt --verify --verbose
```

:::warning
An incorrect fstab entry can cause boot or mount problems. Back up the file and verify UUIDs and filesystem types before enabling persistent mounts.
:::

## WSL2 Windows drives

Windows drives are usually automatically mounted under `/mnt`.

For example:

```bash
ls /mnt/c
```

Navigate to your Windows user directory:

```bash
cd /mnt/c/Users
```

WSL uses DrvFs for Windows drive integration, which has different permissions and filesystem behavior from native Linux filesystems.

## Filesystem types

| Filesystem | Typical use |
|---|---|
| ext4 | Common Linux filesystem |
| XFS | Linux server storage |
| Btrfs | Linux filesystem with advanced features |
| NTFS | Windows disks |
| FAT32 | Portable storage |
| exFAT | Cross-platform removable storage |
| tmpfs | Temporary memory-backed filesystem |
EOF

