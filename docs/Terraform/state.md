---
title: Terraform State
sidebar_position: 6
---

# Understanding Terraform State

Terraform uses state to track the infrastructure it manages.

For a default local configuration, Terraform stores state in:

```text
terraform.tfstate
```

## Why state matters

State allows Terraform to:

- Track managed resources
- Map configuration to real infrastructure
- Identify changes
- Determine which resources to update or remove

## View managed resources

```bash
terraform state list
```

## Inspect a resource

```bash
terraform state show kubernetes_namespace_v1.docs
```

## Inspect the current state

```bash
terraform show
```

## Refresh information during planning

```bash
terraform plan
```

Terraform normally refreshes resource information when generating a plan.

## State backup

When using local state, Terraform may create:

```text
terraform.tfstate.backup
```

Do not rely on this as your only backup strategy.

## Remote state

For team environments, remote state backends can provide shared storage and, depending on the backend, state locking.

Examples include:

- HCP Terraform
- Amazon S3
- Azure Blob Storage
- Google Cloud Storage

## Protect your state files

State files may contain credentials or other sensitive values.

Add these entries to `.gitignore`:

```gitignore
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
crash.log
crash.*.log
*.tfvars
*.tfvars.json
```

Review exceptions for non-sensitive example variable files.

Keep `.terraform.lock.hcl` in Git so provider selections are reproducible.

## Important warning

Never manually edit `terraform.tfstate` unless you have a specific recovery procedure and understand the consequences.

Prefer Terraform's state management commands when changes are necessary.
EOF

