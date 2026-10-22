---
title: Terraform Commands
sidebar_position: 3
---

# Terraform Command Reference

These commands cover the everyday Terraform workflow.

## Initialise a project

```bash
terraform init
```

Downloads required providers and initialises the working directory.

## Format configuration

```bash
terraform fmt
```

Format all Terraform files recursively:

```bash
terraform fmt -recursive
```

## Validate configuration

```bash
terraform validate
```

Checks the configuration for internal consistency and syntax problems.

## Preview changes

```bash
terraform plan
```

Save a plan:

```bash
terraform plan -out=tfplan
```

## Apply changes

```bash
terraform apply
```

Apply a saved plan:

```bash
terraform apply tfplan
```

## View outputs

```bash
terraform output
```

## List managed resources

```bash
terraform state list
```

## Inspect a resource

```bash
terraform state show RESOURCE_ADDRESS
```

## View current state

```bash
terraform show
```

## Destroy infrastructure

```bash
terraform destroy
```

:::danger
`terraform destroy` plans to remove resources managed by the current Terraform configuration. Review the plan carefully before confirming.
:::

## Common workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

After making configuration changes, repeat the format, validate, plan and apply steps.
EOF

