---
title: Installing Git
sidebar_position: 2
---

# Installing Git

## Ubuntu / WSL

```bash
sudo apt update
sudo apt install git -y
```

Verify:

```bash
git --version
```

## Windows

Download Git from:

https://git-scm.com/downloads

## Configure Git

Set your name:

```bash
git config --global user.name "Your Name"
```

Set your email:

```bash
git config --global user.email "you@example.com"
```

Check your configuration:

```bash
git config --global --list
```

## Set the default branch

```bash
git config --global init.defaultBranch main
```

