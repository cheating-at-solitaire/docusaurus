---
title: Kubernetes Troubleshooting
sidebar_position: 8
---

# Kubernetes Troubleshooting

This guide covers common Kubernetes issues and how to investigate them.

## Pod stuck in Pending

Check the Pod:

```bash
kubectl describe pod POD_NAME
```

Look for scheduling errors, insufficient resources, or volume issues.

## ImagePullBackOff

Kubernetes cannot pull the requested container image.

Check:

```bash
kubectl describe pod POD_NAME
```

Possible causes:

- Incorrect image name or tag
- Missing image in Minikube
- Private registry authentication failure
- Network problems

For a locally built image:

```bash
minikube image ls
```

## CrashLoopBackOff

The application starts and repeatedly crashes.

Check logs:

```bash
kubectl logs POD_NAME --previous
```

Check events:

```bash
kubectl describe pod POD_NAME
```

## Service not responding

Check the Service:

```bash
kubectl get svc
kubectl describe svc SERVICE_NAME
```

Check whether the Service has matching endpoints:

```bash
kubectl get endpointslices \
  -l kubernetes.io/service-name=SERVICE_NAME
```

Verify that the Service selector matches the Pod labels and that the application listens on the expected port.

## Terraform deployment problems

Validate Terraform:

```bash
terraform validate
```

Preview changes:

```bash
terraform plan
```

Check Terraform-managed resources:

```bash
terraform state list
```

Check the active Kubernetes context:

```bash
kubectl config current-context
```

## Minikube not running

```bash
minikube status
```

Start the cluster:

```bash
minikube start --driver=docker
```

## Useful diagnostic commands

```bash
kubectl get pods -A
kubectl get events -A
kubectl get deployments -A
kubectl get svc -A
```

Always investigate errors before deleting workloads or resetting your cluster.

