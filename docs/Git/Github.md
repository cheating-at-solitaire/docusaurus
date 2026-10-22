---
title: Working with GitHub
sidebar_position: 6
---

# Working with GitHub

GitHub hosts Git repositories and supports collaboration.

## Create a repository

1. Sign in to GitHub.
2. Select **New repository**.
3. Enter a repository name.
4. Choose public or private.
5. Create the repository.

## Connect an existing project

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/USERNAME/REPOSITORY.git
git push -u origin main
```

If your project is already a Git repository, skip `git init`.

## Clone from GitHub

```bash
git clone https://github.com/USERNAME/REPOSITORY.git
```

## Create a pull request

1. Create a feature branch.
2. Commit your changes.
3. Push the branch to GitHub.
4. Open the repository on GitHub.
5. Select **Compare & pull request**.
6. Review and submit the pull request.

## Check your remote

```bash
git remote -v
```

## GitHub authentication

GitHub supports SSH keys and HTTPS authentication.

For HTTPS Git operations, use an appropriate credential manager or personal access token rather than your account password.

Never commit access tokens, private keys or passwords to Git.

