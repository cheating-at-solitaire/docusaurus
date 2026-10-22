---
title: Git Branching
sidebar_position: 4
---

# Git Branching

Branches allow you to develop features without changing the main branch.

## List branches

```bash
git branch
```

## Create a branch

```bash
git branch feature/new-docs
```

## Create and switch branches

```bash
git switch -c feature/new-docs
```

## Switch branches

```bash
git switch main
```

## Push a branch to GitHub

```bash
git push -u origin feature/new-docs
```

## Delete a local branch

```bash
git branch -d feature/new-docs
```

## Recommended workflow

1. Switch to `main`.
2. Pull the latest changes.
3. Create a feature branch.
4. Make and commit changes.
5. Push your branch.
6. Open a pull request on GitHub.

```bash
git switch main
git pull origin main
git switch -c feature/update-docs
git add .
git commit -m "Update docs"
git push -u origin feature/update-docs
```

