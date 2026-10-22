---
title: Providers and Resources
sidebar_position: 4
---

# Terraform Providers and Resources

Providers are plugins that allow Terraform to interact with external platforms and APIs.

Resources represent objects that Terraform creates or manages.

## Example: Kubernetes provider

Create a file named `providers.tf`:

```hcl
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = pathexpand("~/.kube/config")
  config_context = "minikube"
}
```

## Example: Kubernetes namespace

Create `main.tf`:

```hcl
resource "kubernetes_namespace_v1" "docs" {
  metadata {
    name = "documentation"
  }
}
```

This creates a namespace called `documentation`.

## Initialise Terraform

```bash
terraform init
```

## Preview the change

```bash
terraform plan
```

## Create the namespace

```bash
terraform apply
```

Confirm when prompted.

## Verify in Kubernetes

```bash
kubectl get namespaces
```

You should see the `documentation` namespace.

## Remove the managed resource

```bash
terraform destroy
```

## Resource references

Terraform resources use the format:

```text
resource_type.resource_name
```

For example:

```text
kubernetes_namespace_v1.docs
```

Other resources can reference its attributes to create dependencies automatically.
EOF

