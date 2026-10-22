---
title: Git Merging
sidebar_position: 5
---

# Git Merging

Merging combines changes from one branch into another.

## Merge a feature branch

Switch to the target branch:

```bash
git switch main
```

Merge your feature branch:

```bash
git merge feature/new-docs
```

## Resolve merge conflicts

A conflict may look like:

```text
<<<<<<< HEAD
Current branch content
=======
Incoming branch content
>>>>>>> feature/new-docs
```

Edit the file to keep the correct content and remove the conflict markers.

Then run:

```bash
git add .
git commit
```

If Git already completed the merge automatically, no extra commit is needed.

## Abort a merge

If a merge is in progress and you want to cancel it:

```bash
git merge --abort
```

## Best practices

- Pull changes before starting new work.
- Keep feature branches small.
- Review changes before merging.
- Use pull requests for team collaboration.

