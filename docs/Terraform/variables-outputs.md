---
title: Variables and Outputs
sidebar_position: 5
---

# Terraform Variables and Outputs

Variables make Terraform configurations reusable. Outputs expose useful values after resources have been created.

## Define a variable

In `variables.tf`:

```hcl
variable "namespace_name" {
  description = "Kubernetes namespace to create"
  type        = string
  default     = "documentation"
}
```

## Use the variable

In `main.tf`:

```hcl
resource "kubernetes_namespace_v1" "docs" {
  metadata {
    name = var.namespace_name
  }
}
```

## Override a variable

Using the command line:

```bash
terraform apply -var="namespace_name=development"
```

Or create `terraform.tfvars`:

```hcl
namespace_name = "development"
```

Terraform automatically loads `terraform.tfvars`.

## Define an output

In `outputs.tf`:

```hcl
output "namespace" {
  description = "Name of the created namespace"
  value       = kubernetes_namespace_v1.docs.metadata[0].name
}
```

## View outputs

After applying:

```bash
terraform output
```

View one output:

```bash
terraform output namespace
```

## Variable types

Terraform supports:

- `string`
- `number`
- `bool`
- `list`
- `map`
- `set`
- `object`
- `tuple`

## Sensitive variables

Mark sensitive input values:

```hcl
variable "api_token" {
  type      = string
  sensitive = true
}
```

:::warning
Marking a variable as sensitive hides it from some command output, but does not automatically encrypt it or prevent it from being stored in Terraform state. Use a secure secret-management solution.
:::
EOF

