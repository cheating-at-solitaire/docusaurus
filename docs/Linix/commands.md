---
title: Linux Commands
sidebar_position: 1
---

# Linux Commands Cheat Sheet

A reference for common Linux commands on Ubuntu and WSL.

## Navigation

| Command | Description |
|---|---|
| `pwd` | Show current directory |
| `ls` | List files and folders |
| `ls -la` | Detailed list including hidden files |
| `cd /path` | Change directory |
| `cd ..` | Move up one directory |
| `cd ~` | Go to home directory |
| `clear` | Clear the terminal |

## Files and directories

```bash
mkdir projects
mkdir -p projects/linux/docs
touch example.txt
cp example.txt backup.txt
mv backup.txt renamed.txt
rm renamed.txt
```

Be careful with `rm`, especially when using `-r` or `-f`.

## Viewing files

```bash
cat /etc/os-release
less /etc/os-release
head -n 10 /etc/passwd
tail -n 20 /var/log/dpkg.log
```

## Searching for files

```bash
find ~ -name "*.log"
find /etc -type f -name "*.conf" 2>/dev/null
```

## Searching inside files

```bash
grep "error" application.log
grep -ri "failed" ./logs/
```

## Permissions

```bash
ls -l
chmod 644 example.txt
chmod 755 script.sh
```

Change file ownership:

```bash
sudo chown "$USER:$USER" example.txt
```

## User information

```bash
whoami
id
who
groups
```

## System information

```bash
uname -a
hostname
uptime
free -h
df -h
lsb_release -a
```

## Package management on Ubuntu

```bash
sudo apt update
sudo apt upgrade
sudo apt install curl
sudo apt remove curl
```

## Command history

```bash
history
history | grep kubectl
```

Press Ctrl+R to search previous commands interactively.

## Getting help

```bash
man ls
ls --help
man chmod
```
EOF

