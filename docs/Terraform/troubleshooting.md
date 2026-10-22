---
title: Terraform Troubleshooting
sidebar_position: 8
---

# Terraform Troubleshooting

Common Terraform errors and how to investigate them.

## Terraform command not found

Check installation:

```bash
which terraform
terraform version
```

If the command is missing, install Terraform and check your PATH.

## Provider installation fails

Run:

```bash
terraform init
```

Check internet access, provider version constraints and registry availability.

For detailed diagnostics:

```bash
TF_LOG=DEBUG terraform init
```

Debug output may contain sensitive information. Do not share it without reviewing it first.

## Invalid configuration

Format your files:

```bash
terraform fmt -recursive
```

Validate:

```bash
terraform validate
```

Check the reported file and line number.

## Kubernetes connection refused

Check Minikube:

```bash
minikube status
```

Check your Kubernetes context:

```bash
kubectl config current-context
```

Check the API server:

```bash
kubectl cluster-info
```

If Minikube is stopped:

```bash
minikube start --driver=docker
```

## Resource already exists

Terraform may report that a resource already exists.

Check Kubernetes:

```bash
kubectl get all -A
```

If an existing resource should be managed by Terraform, investigate `terraform import`.

Do not delete existing resources without checking whether other applications depend on them.

## State lock errors

A state lock prevents concurrent modifications where the backend supports locking.

Check whether another Terraform process is running.

If you are certain the lock is stale, investigate:

```bash
terraform force-unlock LOCK_ID
```

:::danger
Never force-unlock state while another Terraform operation is actively using it.
:::

## Unexpected infrastructure changes

Run:

```bash
terraform plan
```

Review whether resources were modified manually outside Terraform.

Where possible, update the Terraform configuration rather than repeatedly making manual changes.

## Deployment created but Pods are failing

Check:

```bash
kubectl get pods -A
kubectl describe pod POD_NAME -n NAMESPACE
kubectl logs POD_NAME -n NAMESPACE
```

Common causes include:

- Incorrect container image
- Insufficient cluster resources
- Invalid application configuration
- Missing Secrets or ConfigMaps
- Application startup failures

## Useful troubleshooting workflow

```bash
terraform fmt
terraform validate
terraform plan
kubectl get nodes
kubectl get pods -A
```

Fix the underlying issue before applying additional changes.
EOF

