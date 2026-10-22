---
title: Kubernetes Deployments
sidebar_position: 4
---

# Kubernetes Deployments

A Deployment manages application Pods, replicas and rolling updates.

## Create a Deployment

```bash
kubectl create deployment nginx \
  --image=nginx:alpine
```

## List Deployments

```bash
kubectl get deployments
```

## View Deployment details

```bash
kubectl describe deployment nginx
```

## Scale an application

Increase the number of replicas:

```bash
kubectl scale deployment nginx --replicas=3
```

Verify:

```bash
kubectl get pods
```

## Update a Deployment

Change the container image:

```bash
kubectl set image deployment/nginx \
  nginx=nginx:1.27-alpine
```

Check the rollout:

```bash
kubectl rollout status deployment/nginx
```

## Roll back a Deployment

```bash
kubectl rollout undo deployment/nginx
```

## Restart a Deployment

```bash
kubectl rollout restart deployment/nginx
```

## Delete a Deployment

```bash
kubectl delete deployment nginx
```

## Deployments with Terraform

Terraform can manage Kubernetes Deployments using the Kubernetes provider.

For Terraform-managed resources, prefer changing the Terraform configuration and running:

```bash
terraform plan
terraform apply
```

This helps prevent configuration drift caused by manual changes.

