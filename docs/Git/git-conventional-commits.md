---
id: git-conventional-commits
title: Git Conventional Commits Guide
sidebar_label: Conventional Commits
description: Learn how to use Conventional Commits in Git, including chore, feat, fix, docs, refactor, and other commit message types.
tags:
  - git
  - conventional-commits
  - best-practices
---

# Git Conventional Commits Guide

## Overview

Conventional Commits is a standardised approach to writing Git commit messages.

It helps developers maintain a clear, consistent, and readable commit history.

A Conventional Commit uses a prefix to describe the type of change being committed.

For example:

```bash
git commit -m "chore: update project dependencies"
```

In this example:

- `chore` identifies the type of change.
- `update project dependencies` describes what was changed.

:::info
Conventional Commits is a naming convention, not a built-in Git feature. Git does not enforce these prefixes automatically.
:::

---

## 1. What Does `chore` Mean in Git?

The `chore` prefix is used for routine maintenance tasks that do not directly introduce new features or fix bugs.

### Example

```bash
git commit -m "chore: update project dependencies"
```

### When to Use `chore`

Use `chore` for maintenance activities such as:

- Updating dependencies.
- Removing unused files.
- Cleaning up obsolete scripts.
- Updating repository configuration.
- Performing general project housekeeping.

### Examples

```bash
git commit -m "chore: clean up unused files"
```

```bash
git commit -m "chore: update npm dependencies"
```

```bash
git commit -m "chore: update gitignore"
```

```bash
git commit -m "chore: remove obsolete scripts"
```

:::tip
Use `chore` when the change is primarily project maintenance rather than a feature, bug fix, or documentation update.
:::

---

## 2. Common Conventional Commit Types

The following table explains commonly used commit prefixes.

| Prefix | Description | Example |
|--------|-------------|---------|
| `feat` | Introduces a new feature | `feat: add login page` |
| `fix` | Fixes a bug | `fix: resolve login error` |
| `chore` | Routine maintenance | `chore: update dependencies` |
| `docs` | Documentation changes | `docs: update README` |
| `refactor` | Restructures code without changing behaviour | `refactor: simplify login logic` |
| `test` | Adds or updates tests | `test: add login unit tests` |
| `style` | Changes code formatting | `style: fix indentation` |
| `ci` | Updates CI/CD configuration | `ci: update GitHub Actions workflow` |
| `build` | Updates build systems or dependencies | `build: update webpack configuration` |
| `perf` | Improves performance | `perf: optimise database queries` |

:::note
The Conventional Commits specification explicitly defines `feat` and `fix`. Other types, including `chore`, are widely used conventions that teams can customise.
:::

---

## 3. Conventional Commit Message Structure

A Conventional Commit normally follows this structure:

```text
<type>(<scope>): <description>
```

The scope is optional.

### Example

```bash
git commit -m "chore(deps): update React dependencies"
```

### Breakdown

| Component | Description |
|-----------|-------------|
| `chore` | Type of change |
| `deps` | Optional scope identifying the affected area |
| `update React dependencies` | Short description of the change |

### More Examples

**Feature commit**

```bash
git commit -m "feat(auth): add password reset functionality"
```

**Bug fix commit**

```bash
git commit -m "fix(login): resolve incorrect password validation"
```

**Documentation commit**

```bash
git commit -m "docs(git): add interactive rebase guide"
```

**Maintenance commit**

```bash
git commit -m "chore(deps): update npm packages"
```

---

## 4. Difference Between `feat`, `fix`, and `chore`

These are three commonly used commit types.

### `feat` — New Functionality

Use `feat` when introducing new functionality.

```bash
git commit -m "feat: add user registration page"
```

### `fix` — Bug Fix

Use `fix` when correcting existing functionality.

```bash
git commit -m "fix: resolve login validation error"
```

### `chore` — Maintenance

Use `chore` for routine maintenance work.

```bash
git commit -m "chore: remove unused dependencies"
```

### Comparison

| Type | Adds functionality? | Fixes a bug? | Primary purpose |
|------|---------------------|--------------|-----------------|
| `feat` | Yes | No | New functionality |
| `fix` | No | Yes | Correct behaviour |
| `chore` | Usually no | Usually no | Project maintenance |

---

## 5. Practical Git Workflow

The following example demonstrates how to create a Conventional Commit.

### Step 1: Check the Working Tree

```bash
git status
```

### Step 2: Stage Your Changes

For a specific file:

```bash
git add package.json
```

Or stage all intended changes:

```bash
git add .
```

### Step 3: Create a Commit

```bash
git commit -m "chore(deps): update project dependencies"
```

### Step 4: Verify the Commit

```bash
git log --oneline
```

Example output:

```text
a1b2c3d chore(deps): update project dependencies
e4f5g6h feat(auth): add login functionality
i7j8k9l fix(auth): resolve login validation issue
```

Your commit history now clearly identifies the purpose of each change.

---

## 6. Choosing the Correct Commit Type

Use the following guidance when selecting a commit prefix.

| Change | Recommended prefix |
|--------|--------------------|
| Adding a new login page | `feat` |
| Fixing a broken login button | `fix` |
| Updating the README | `docs` |
| Removing unused scripts | `chore` |
| Improving application performance | `perf` |
| Reorganising existing code | `refactor` |
| Adding unit tests | `test` |
| Updating a GitHub Actions workflow | `ci` |
| Changing code indentation | `style` |
| Updating build configuration | `build` |

:::tip
Some changes can reasonably fit more than one type. For example, dependency updates may use `chore(deps)` or `build(deps)`, depending on your team's conventions. Consistency is more important than choosing a universal label.
:::

---

## 7. Breaking Changes

Conventional Commits also supports marking changes that are incompatible with previous behaviour.

A breaking change can be indicated with an exclamation mark (`!`) after the type or scope.

### Example

```bash
git commit -m "feat(api)!: remove deprecated authentication endpoint"
```

Alternatively, use a `BREAKING CHANGE:` footer in the commit message.

```text
feat(api): update authentication endpoints

BREAKING CHANGE: The legacy login endpoint has been removed.
```

:::warning
Breaking changes should be clearly documented because they may require other developers or users to update their code.
:::

---

## 8. Benefits of Conventional Commits

Using Conventional Commits provides several advantages:

1. **Readable history:** Developers can quickly understand why changes were made.
2. **Consistent commit messages:** Teams follow a common format.
3. **Simpler code reviews:** Commit types make changes easier to categorise.
4. **Automated changelogs:** Tools can generate release notes from commit history.
5. **Automated versioning:** Release tools can determine version increments from commit types and breaking-change markers.

---

## 9. Common Mistakes

### Using `chore` for a New Feature

Incorrect:

```bash
git commit -m "chore: add login functionality"
```

Recommended:

```bash
git commit -m "feat: add login functionality"
```

### Using `feat` for a Bug Fix

Incorrect:

```bash
git commit -m "feat: fix broken login button"
```

Recommended:

```bash
git commit -m "fix: resolve broken login button"
```

### Writing Vague Commit Messages

Avoid:

```bash
git commit -m "chore: updates"
```

Prefer:

```bash
git commit -m "chore: remove unused configuration files"
```

---

## 10. Quick Reference

| Prefix | Use when |
|--------|----------|
| `feat` | Adding new functionality |
| `fix` | Fixing a bug |
| `chore` | Performing routine maintenance |
| `docs` | Updating documentation |
| `refactor` | Restructuring code |
| `test` | Updating tests |
| `style` | Changing formatting |
| `ci` | Modifying CI/CD workflows |
| `build` | Updating build tooling |
| `perf` | Improving performance |

---

## Summary

Conventional Commits provides a consistent way to describe changes in Git.

The most important types to remember are:

```bash
git commit -m "feat: add new functionality"
git commit -m "fix: resolve application bug"
git commit -m "chore: update dependencies"
git commit -m "docs: update documentation"
git commit -m "refactor: simplify existing code"
```

**Key takeaway:** Use `chore` for routine project maintenance, `feat` for new functionality, and `fix` for bug fixes.

For the official specification, see [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).
