---
title: TL;DR - Quick Command Help
sidebar_position: 7
---

# TL;DR (tldr) - Quick Linux Command Help

TL;DR stands for "Too Long; Didn't Read".

The `tldr` tool provides short, practical examples of commands, making it a useful alternative to reading full Linux manual pages.

## Why use tldr?

- Find commonly used command examples quickly.
- Learn unfamiliar Linux commands.
- Avoid searching through long manual pages.
- Discover useful command options.
- Improve your command-line skills.

## Installing tldr on Ubuntu

One way to install a TL;DR client is with npm:

```bash
npm install -g tldr
```

Check the installation:

```bash
tldr --version
```

If npm is not installed, install Node.js and npm first.

## Basic usage

The syntax is:

```bash
tldr COMMAND
```

For example:

```bash
tldr ls
```

This displays practical examples of the `ls` command.

## Common examples

### File management

```bash
tldr ls
tldr cp
tldr mv
tldr rm
tldr mkdir
tldr find
```

### Networking

```bash
tldr ping
tldr curl
tldr wget
tldr ssh
tldr ip
tldr ss
```

### Process management

```bash
tldr ps
tldr top
tldr kill
tldr pkill
tldr systemctl
```

### Disk management

```bash
tldr df
tldr du
tldr lsblk
tldr mount
tldr umount
tldr fdisk
```

### Git commands

```bash
tldr git
tldr git-commit
tldr git-branch
tldr git-push
tldr git-pull
```

### Docker and Kubernetes

```bash
tldr docker
tldr docker-run
tldr kubectl
tldr kubectl-get
tldr kubectl-apply
```

### Terraform

```bash
tldr terraform
tldr terraform-init
tldr terraform-plan
tldr terraform-apply
```

Some command pages may not be available in every TL;DR client or platform.

## Update the local command cache

For the npm `tldr` client:

```bash
tldr --update
```

## List available commands

```bash
tldr --list
```

## Search for command pages

```bash
tldr --search "archive"
```

Support for search options may vary between clients.

## TL;DR vs man vs --help

| Tool | Purpose |
|---|---|
| `tldr ls` | Quick practical examples |
| `man ls` | Detailed manual documentation |
| `ls --help` | Built-in command options |

## Example: Learning tar

Run:

```bash
tldr tar
```

You can discover examples such as:

Create a compressed archive:

```bash
tar -czvf backup.tar.gz myfolder/
```

Extract a compressed archive:

```bash
tar -xzvf backup.tar.gz
```

List archive contents:

```bash
tar -tzvf backup.tar.gz
```

## Example: Learning find

Run:

```bash
tldr find
```

Find all Markdown files:

```bash
find . -name "*.md"
```

Find files larger than 100 MB:

```bash
find . -type f -size +100M
```

## TL;DR in daily administration

A useful workflow is:

1. Find a command using `tldr`.
2. Review the example and its options.
3. Read `man COMMAND` when more detail is needed.
4. Test commands carefully before running them against important data.

:::warning
TL;DR examples are educational. Commands that delete files, format disks or modify infrastructure can still be destructive. Always understand a command before executing it.
:::

## Official project

Visit the TL;DR Pages project:

https://github.com/tldr-pages/tldr

You can also browse examples online:

https://tldr.sh/
EOF

