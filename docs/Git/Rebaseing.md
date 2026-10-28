---
id: git-rebase-guide
title: Git Commit History and Interactive Rebase
sidebar_label: Git Rebase Guide
description: A practical guide to viewing Git commit history, interactive rebasing, squashing commits, resolving conflicts, and pushing rewritten history.
tags:
  - git
  - rebase
  - version-control
  - development
---

# Git Commit History and Interactive Rebase

## Overview

This guide explains how to use Git commands to inspect commit history, modify recent commits, combine multiple commits into one, and safely manage rebasing.

By the end of this guide, you will understand how to:

- View your Git commit history.
- Use interactive rebase to modify commits.
- Squash multiple commits into a single commit.
- Resolve conflicts during a rebase.
- Abort a rebase when necessary.
- Push rebased commits to a remote repository.

---

## 1. Viewing Git Commit History

### Command

```bash
git log --oneline
```

### Description

The `git log --oneline` command displays Git commit history in a compact format, with each commit appearing on a single line.

### Example

```text
a1b2c3d Added login validation
e4f5g6h Fixed login bug
i7j8k9l Created login page
m1n2o3p Initial commit
```

Each entry contains:

| Component | Description |
|-----------|-------------|
| Commit hash | A shortened unique identifier for the commit |
| Commit message | A description of the changes made |
| Order | The most recent commit appears first |

### When to use it

Use this command when you want to:

- Review recent changes.
- Identify commits to modify.
- Find a commit hash.
- Check commit history before creating a Pull Request.

---

## 2. Interactive Git Rebase

### Command

```bash
git rebase -i HEAD~2
```

### Description

Interactive rebase allows you to modify commit history.

The command above opens an interactive editor containing the last two commits.

### Command breakdown

| Component | Description |
|-----------|-------------|
| `git rebase` | Replays commits onto a selected base |
| `-i` | Enables interactive mode |
| `HEAD` | Refers to the current commit |
| `~2` | Refers to the commit two positions before HEAD |

### Example commit history

```text
a1b2c3d Added login validation
e4f5g6h Fixed login bug
i7j8k9l Created login page
m1n2o3p Initial commit
```

Running:

```bash
git rebase -i HEAD~2
```

Opens an editor similar to:

```text
pick e4f5g6h Fixed login bug
pick a1b2c3d Added login validation
```

:::info

The interactive rebase editor lists commits from oldest to newest, unlike `git log`, which normally displays the newest commit first.

:::

### Available interactive rebase actions

| Action | Description |
|--------|-------------|
| `pick` | Keep the commit |
| `reword` | Change the commit message |
| `edit` | Pause to modify the commit |
| `squash` | Combine the commit with the previous commit and edit the message |
| `fixup` | Combine with the previous commit, normally discarding this commit's message |
| `drop` | Remove the commit |

---

## 3. Squashing Multiple Commits

### What is squashing?

Squashing is the process of combining multiple Git commits into one commit.

It is commonly used to clean up development history before creating a Pull Request.

### Example scenario

Imagine you are working on a feature branch called:

```text
feature/login
```

You have created three commits:

```text
a1b2c3d Fixed login button styling
e4f5g6h Added login validation
i7j8k9l Created login form
m1n2o3p Initial project setup
```

You want to combine the three login-related commits into one.

### Step 1: Check your working tree

```bash
git status
```

Ensure you have no uncommitted changes before starting the rebase.

### Step 2: View your commits

```bash
git log --oneline
```

Identify the commits you want to combine.

### Step 3: Start interactive rebase

```bash
git rebase -i HEAD~3
```

Git opens the following editor:

```text
pick i7j8k9l Created login form
pick e4f5g6h Added login validation
pick a1b2c3d Fixed login button styling
```

### Step 4: Modify the rebase actions

Change the second and third commits from `pick` to `squash`.

```text
pick i7j8k9l Created login form
squash e4f5g6h Added login validation
squash a1b2c3d Fixed login button styling
```

This instructs Git to:

1. Keep the first commit as the starting point.
2. Combine the second commit into the first.
3. Combine the third commit into the resulting commit.

Save and close the editor.

### Step 5: Update the commit message

Git opens another editor where you can specify the combined commit message.

For example:

```text
Implemented login feature with validation and styling
```

Save and close the editor.

### Step 6: Verify the result

Run:

```bash
git log --oneline
```

Expected output:

```text
x9y8z7w Implemented login feature with validation and styling
m1n2o3p Initial project setup
```

The three original feature commits have now been combined into one.

:::tip

Squashing changes the commit history but preserves the combined code changes when the rebase completes successfully.

:::

---

## 4. Resolving Conflicts During a Rebase

### What is a rebase conflict?

A conflict can occur when Git cannot automatically apply a commit while replaying history.

For example:

```text
CONFLICT (content): Merge conflict in login.js
error: could not apply a1b2c3d
```

Git pauses the rebase so you can resolve the conflict.

### Step 1: Check the status

```bash
git status
```

This shows which files contain conflicts.

### Step 2: Resolve the conflicting files

Open the affected files and resolve the conflicting changes.

A conflict may appear as:

```text
<<<<<<< HEAD
const loginEnabled = false;
=======
const loginEnabled = true;
>>>>>>> a1b2c3d
```

Edit the file to keep the desired code and remove the conflict markers.

For example:

```javascript
const loginEnabled = true;
```

### Step 3: Stage the resolved files

```bash
git add login.js
```

### Step 4: Continue the rebase

```bash
git rebase --continue
```

Git resumes the rebase.

If additional conflicts occur, repeat the process.

---

## 5. Aborting a Git Rebase

### Command

```bash
git rebase --abort
```

### Description

The `git rebase --abort` command cancels a rebase that is currently in progress.

Git restores the branch to its state before the rebase started.

### Example

Start a rebase:

```bash
git rebase -i HEAD~3
```

During the rebase, Git encounters a conflict:

```text
CONFLICT (content): Merge conflict in login.js
```

If you decide not to continue:

```bash
git rebase --abort
```

The rebase is cancelled.

:::warning

`git rebase --abort` only works while a rebase is in progress.

It cannot directly undo a rebase that has already completed successfully.

:::

---

## 6. Continuing or Skipping a Rebase

Git provides additional commands for managing an interrupted rebase.

### Continue a rebase

```bash
git rebase --continue
```

Use this after resolving conflicts or completing a requested commit edit.

### Skip a commit

```bash
git rebase --skip
```

This skips the commit Git is currently attempting to apply.

:::caution

Skipping a commit may cause changes from that commit to be omitted from the final history. Review the result carefully.

:::

---

## 7. Pushing Rebasing Changes to a Remote Repository

After successfully squashing commits, you may need to update your remote feature branch.

### Scenario A: The branch has never been pushed

Use:

```bash
git push -u origin feature/login
```

This pushes your local branch and sets its upstream tracking branch.

### Scenario B: The branch has already been pushed

Because rebasing rewrites commit history, a normal push may be rejected.

You may need:

```bash
git push --force-with-lease origin feature/login
```

### Why use `--force-with-lease`?

`--force-with-lease` provides an additional safety check compared with `--force`.

It normally refuses to overwrite a remote branch if its current state differs from the remote-tracking information you have locally.

:::warning

Avoid force-pushing to shared branches such as `main` or `develop`.

Only rewrite remote history when you understand the impact on other developers and your team's branching policy permits it.

:::

---

## 8. Practical End-to-End Example

The following example demonstrates a typical workflow for preparing a feature branch before creating a Pull Request.

### Step 1: Switch to your feature branch

```bash
git switch feature/login
```

### Step 2: Check your working tree

```bash
git status
```

### Step 3: Review your commit history

```bash
git log --oneline
```

Example:

```text
a1b2c3d Fixed login button styling
e4f5g6h Added login validation
i7j8k9l Created login form
m1n2o3p Initial project setup
```

### Step 4: Squash the last three commits

```bash
git rebase -i HEAD~3
```

Update the interactive editor:

```text
pick i7j8k9l Created login form
squash e4f5g6h Added login validation
squash a1b2c3d Fixed login button styling
```

Save and close the editor.

### Step 5: Enter the final commit message

```text
Implemented login feature with validation and styling
```

### Step 6: Verify the commit history

```bash
git log --oneline
```

Expected result:

```text
x9y8z7w Implemented login feature with validation and styling
m1n2o3p Initial project setup
```

### Step 7: Push the changes

If the branch has not been pushed before:

```bash
git push -u origin feature/login
```

If the branch was previously pushed and its history has been rewritten:

```bash
git push --force-with-lease origin feature/login
```

Your feature branch is now ready for a Pull Request.

---

## 9. Common Problems and Solutions

| Problem | Solution |
|---------|----------|
| Unsure which commits to squash | Run `git log --oneline` |
| Rebase stops due to a conflict | Resolve conflicts, stage files, then run `git rebase --continue` |
| Want to cancel an ongoing rebase | Run `git rebase --abort` |
| Accidentally selected a commit to skip | Abort the rebase before it completes, or review recovery options |
| Remote rejects a push after rebasing | Check the remote history before considering `git push --force-with-lease` |
| Need to modify the last three commits | Run `git rebase -i HEAD~3` |
| Want to change only a commit message | Use `reword` during interactive rebase |

---

## 10. Git Command Quick Reference

| Command | Purpose |
|---------|---------|
| `git status` | Check working tree status |
| `git log --oneline` | Display compact commit history |
| `git rebase -i HEAD~2` | Interactively modify the last two commits |
| `git rebase -i HEAD~3` | Interactively modify the last three commits |
| `git rebase --continue` | Continue an interrupted rebase |
| `git rebase --abort` | Cancel an ongoing rebase |
| `git rebase --skip` | Skip the commit currently being applied |
| `git push -u origin feature/login` | Push a new feature branch |
| `git push --force-with-lease origin feature/login` | Update a remote branch after rewriting history |

---

## 11. Best Practices

When working with Git rebasing, follow these recommendations:

1. **Check your working tree first.** Avoid starting a rebase with uncommitted changes.
2. **Review your commits.** Use `git log --oneline` to identify the correct commits.
3. **Keep commits meaningful.** Squash small fix-up commits when appropriate.
4. **Use descriptive commit messages.** Explain the purpose of the change.
5. **Avoid rewriting shared history.** Coordinate with your team before rebasing pushed commits.
6. **Prefer `--force-with-lease`.** It is safer than an unconditional force push, although it still requires care.
7. **Verify after rebasing.** Check your commit history and run relevant tests before pushing.

---

## Summary

Git interactive rebase is a useful tool for maintaining a clean and understandable commit history.

The three core commands are:

```bash
# View commit history
git log --oneline

# Interactively modify the last two commits
git rebase -i HEAD~2

# Cancel an ongoing rebase
git rebase --abort
```

For squashing multiple commits:

```bash
git rebase -i HEAD~3
```

Use `pick` for the first commit and `squash` for subsequent commits you want to combine.

**Key takeaway:** Interactive rebasing allows you to organise your commit history before creating a Pull Request, making changes easier to review and maintain.
