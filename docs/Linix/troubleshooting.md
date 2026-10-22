---
title: Linux Troubleshooting
sidebar_position: 2
---

# Linux Troubleshooting Guide

A practical checklist for diagnosing Linux system problems.

## Check system information

```bash
uname -a
cat /etc/os-release
uptime
```

## Check memory

```bash
free -h
```

Inspect memory usage:

```bash
ps aux --sort=-%mem | head
```

## Check CPU usage

```bash
top
```

Show processes using the most CPU:

```bash
ps aux --sort=-%cpu | head
```

## Check disk usage

```bash
df -h
```

Find large directories:

```bash
du -sh ~/*
```

## Check system logs

On systems using systemd:

```bash
journalctl -p err -b
journalctl -xe
```

View recent kernel messages:

```bash
sudo dmesg | tail -n 30
```

WSL may expose fewer kernel and service logs than a full Linux installation.

## Check services

```bash
systemctl --failed
systemctl status ssh
```

Replace `ssh` with the service you want to inspect.

These commands require systemd to be running.

## Troubleshoot permission denied

Inspect permissions:

```bash
ls -l filename
```

Inspect ownership:

```bash
stat filename
```

Only change permissions when you understand the access requirements.

## Troubleshoot command not found

Check whether the command exists:

```bash
command -v docker
command -v kubectl
```

Check your PATH:

```bash
echo "$PATH"
```

## Troubleshoot an application that will not start

Check whether the expected port is occupied:

```bash
sudo ss -ltnp
```

Check processes:

```bash
ps aux | grep -i application_name
```

For example, if Docusaurus cannot use port 3000:

```bash
sudo ss -ltnp 'sport = :3000'
```

## Troubleshooting workflow

1. Read the exact error message.
2. Check logs and service status.
3. Check CPU, memory and disk space.
4. Check network connectivity.
5. Identify the root cause before changing configuration.
EOF

