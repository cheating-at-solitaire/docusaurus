---
title: Installing Minikube
sidebar_position: 2
---

# Installing Kubernetes with Minikube

Minikube provides a local Kubernetes cluster for development and testing.

## Prerequisites

You need:

- Docker
- Minikube
- kubectl
- A Linux environment or WSL2

## Check installed tools

```bash
docker --version
minikube version
kubectl version --client
```

## Start Minikube

```bash
minikube start --driver=docker
```

## Check cluster status

```bash
minikube status
kubectl get nodes
```

The node should show a `Ready` status.

## View all Pods

```bash
kubectl get pods -A
```

## Stop Minikube

```bash
minikube stop
```

## Restart Minikube

```bash
minikube start
```

## Delete the cluster

```bash
minikube delete
```

:::danger
Deleting a Minikube cluster removes the Kubernetes workloads and cluster data stored within it. Only run this when you intend to reset the cluster.
:::

