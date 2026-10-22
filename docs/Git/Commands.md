
---
title: Basic Git Commands
sidebar_position: 3
---

# Basic Git Commands

## Initialise a repository

```bash
git init
```

## Clone a repository

```bash
git clone https://github.com/USERNAME/REPOSITORY.git
```

## Check changes

```bash
git status
```

## Stage changes

Stage one file:

```bash
git add README.md
```

Stage all changes:

```bash
git add .
```

## Commit changes

```bash
git commit -m "Add documentation"
```

## View commit history

```bash
git log --oneline
```

## Connect to a remote repository

```bash
git remote add origin https://github.com/USERNAME/REPOSITORY.git
```

## Push changes

```bash
git push -u origin main
```

## Pull updates

```bash
git pull origin main
```

## View differences

```bash
git diff
```

## Restore a tracked file

```bash
git restore README.md
```

**Warning:** Restoring a file discards its uncommitted changes.

