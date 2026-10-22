---
title: Introduction to Terraform
sidebar_position: 1
---

# Introduction to Terraform

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp.

It allows you to define and manage infrastructure using configuration files instead of manually creating resources.

## Why use Terraform?

- Automate infrastructure provisioning
- Store infrastructure configuration in Git
- Review changes before applying them
- Reuse configurations across environments
- Manage Kubernetes and cloud resources

## How Terraform works

Terraform compares your configuration with its recorded state and the actual infrastructure to determine what needs to change.

The standard workflow is:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Key concepts

| Concept | Description |
|---|---|
| Provider | Plugin used to interact with an API |
| Resource | Infrastructure object managed by Terraform |
| Data source | Reads existing information |
| Variable | Configurable input value |
| Output | Value exposed after applying configuration |
| State | Record of Terraform-managed infrastructure |
| Module | Reusable collection of Terraform configuration |

## Terraform file extensions

| File | Purpose |
|---|---|
| main.tf | Main infrastructure configuration |
| variables.tf | Input variable declarations |
| outputs.tf | Output values |
| providers.tf | Provider requirements and configuration |
| terraform.tfvars | Variable values |
| .terraform.lock.hcl | Selected provider dependency versions |

## Terraform and Kubernetes

Terraform can manage Kubernetes resources such as:

- Namespaces
- Deployments
- Services
- ConfigMaps
- Ingress resources

This makes Terraform useful for managing applications in a local Minikube cluster.
EOF

