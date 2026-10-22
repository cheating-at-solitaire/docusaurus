---
title: Installing Terraform
sidebar_position: 2
---

# Installing Terraform on Ubuntu and WSL

Terraform can be installed on Ubuntu or WSL2 using the official HashiCorp package repository.

## Check whether Terraform is installed

```bash
terraform version
```

If Terraform is already installed, you can continue using your current version.

## Install prerequisites

```bash
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common curl
```

## Add the HashiCorp signing key

```bash
wget -O- https://apt.releases.hashicorp.com/gpg |
  gpg --dearmor |
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

Run the command above as one shell pipeline.

## Add the repository

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && echo "$VERSION_CODENAME") main" |
  sudo tee /etc/apt/sources.list.d/hashicorp.list
```

## Install Terraform

```bash
sudo apt-get update
sudo apt-get install -y terraform
```

## Verify installation

```bash
terraform version
```

## Recommended additional tools

For Kubernetes development:

```bash
docker --version
minikube version
kubectl version --client
```

## Terraform autocomplete

Install shell autocomplete if desired:

```bash
terraform -install-autocomplete
```

Restart your shell to activate it.
EOF

