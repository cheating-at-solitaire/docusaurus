---
id: terminal-tips-and-tricks
title: Terminal Tips and Tricks
sidebar_label: Terminal Tips and Tricks
description: Beginner-friendly guide to terminal history, navigation, brace expansion, and job control.
---

# Terminal Tips and Tricks

Learn practical terminal shortcuts and commands to work more efficiently. Examples use Bash; some behaviour may differ in Zsh or other shells.

## Prerequisites

- A Linux or macOS terminal, or a Bash-compatible environment.
- Basic familiarity with entering commands.

## 1. Search your command history

1. Press **Ctrl + R** to start reverse history search.
2. Type part of an earlier command, such as `git commit`.
3. Press **Ctrl + R** again to cycle to older matches.
4. Press **Enter** to execute the match, or **Ctrl + G** to cancel in Bash.

:::tip
In many Bash configurations, the right-arrow key accepts the matched command for editing without executing it.
:::

## 2. Jump back to your previous directory

```bash
cd ~/projects
cd /tmp
cd -
```

The final command returns to `~/projects`. Run `cd -` again to switch back to `/tmp`.

## 3. Use brace expansion

### Create several directories

```bash
mkdir {development,testing,production}
```

### Create several files

```bash
touch file{1,2,3}.txt
```

Creates `file1.txt`, `file2.txt`, and `file3.txt`.

### Generate a sequence

```bash
echo {1..5}
```

Output:

```text
1 2 3 4 5
```

### Create a backup

```bash
cp config.yaml{,.bak}
```

Equivalent to `cp config.yaml config.yaml.bak`.

## 4. View and reuse previous commands

Show command history:

```bash
history
```

Show the last ten commands:

```bash
history 10
```

Example output:

```text
101  cd ~/projects
102  git status
103  git add .
104  git commit -m "Update documentation"
```

In Bash, `!102` reruns history entry 102.

:::caution
History expansion immediately executes the selected command. Verify the entry before using it, especially for commands that change or delete files.
:::

## 5. Suspend and resume a running command

Press **Ctrl + Z** to suspend the current foreground process. Then:

```bash
jobs  # List jobs
fg    # Resume the current job in the foreground
bg    # Resume the current job in the background
```

**Ctrl + Z** suspends a process; **Ctrl + C** interrupts it. Not every program can run usefully in the background.

## 6. Useful terminal shortcuts

| Shortcut | Action |
| --- | --- |
| `Ctrl + R` | Search command history |
| `Ctrl + C` | Interrupt the current foreground command |
| `Ctrl + Z` | Suspend the foreground process |
| `Ctrl + A` | Move to the beginning of the line |
| `Ctrl + E` | Move to the end of the line |
| `Ctrl + U` | Delete from the cursor to the beginning of the line |
| `Ctrl + L` | Clear the terminal display |
| `Tab` | Complete a command or path when supported |

## 7. Practice exercise

Run these commands in order:

```bash
mkdir terminal-practice
cd terminal-practice
touch test{1,2,3}.txt
ls
cd -
history 10
```

Check that `ls` shows `test1.txt`, `test2.txt`, and `test3.txt`.

## Summary

You can now search command history, switch directories quickly, create multiple files with brace expansion, inspect earlier commands, suspend and resume processes, and use common keyboard shortcuts.

:::note
This is a practical training guide based on the previously prepared summary of the video, not a word-for-word transcript.
:::
