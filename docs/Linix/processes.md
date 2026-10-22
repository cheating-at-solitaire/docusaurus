---
title: Linux Process Management
sidebar_position: 4
---

# Linux Process Management

Learn how to inspect, monitor and control running Linux processes.

## List running processes

```bash
ps aux
```

Show processes as a tree:

```bash
ps -ef --forest
```

## Find a process

```bash
pgrep -a nginx
```

Or search:

```bash
ps aux | grep nginx
```

## Monitor processes

```bash
top
```

Install an interactive monitor:

```bash
sudo apt install htop
htop
```

## Find CPU-intensive processes

```bash
ps aux --sort=-%cpu | head
```

## Find memory-intensive processes

```bash
ps aux --sort=-%mem | head
```

## Stop a process

First find its process ID:

```bash
pgrep -a nginx
```

Request graceful termination:

```bash
kill PID
```

Replace `PID` with the process ID.

## Force-stop a process

```bash
kill -9 PID
```

Only use SIGKILL when normal termination does not work. It prevents the process from cleaning up normally.

## Background jobs

Start a command in the background:

```bash
sleep 120 &
```

List shell jobs:

```bash
jobs
```

Bring a job to the foreground:

```bash
fg %1
```

## Suspend and resume

Press Ctrl+Z to suspend the foreground process.

Resume it in the background:

```bash
bg %1
```

## Service management

On systemd-enabled Ubuntu:

```bash
systemctl status ssh
sudo systemctl restart ssh
sudo systemctl stop ssh
sudo systemctl start ssh
```

These commands require systemd and the named service to be installed.

## Docusaurus example

Find a Docusaurus process:

```bash
ps aux | grep docusaurus
```

Check its listening port:

```bash
ss -ltnp 'sport = :3000'
```

If Docusaurus is running in your terminal, stop it with Ctrl+C.
EOF

