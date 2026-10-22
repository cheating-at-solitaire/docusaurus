---
title: Introduction to Kubernetes
sidebar_position: 1
---

# Introduction to Kubernetes

Kubernetes (K8s) is an open-source platform for deploying, scaling and managing containerised applications.

## Why use Kubernetes?

- Automatically restart failed containers.
- Run multiple replicas of an application.
- Distribute traffic between application Pods.
- Roll out new application versions.
- Manage application configuration and networking.

## Core Kubernetes components

| Component | Purpose |
|---|---|
| Cluster | A group of machines running Kubernetes |
| Node | A machine that runs workloads |
| Pod | The smallest deployable unit |
| Deployment | Manages application replicas and updates |
| Service | Provides stable network access to Pods |
| Ingress | Routes HTTP/HTTPS traffic to Services |
| Namespace | Organises resources within a cluster |
| ConfigMap | Stores non-sensitive configuration |
| Secret | Stores sensitive configuration |

## Kubernetes architecture

A Kubernetes cluster consists of:

### Control plane

Manages the cluster, schedules workloads and maintains the desired state.

### Worker nodes

Run application Pods using a container runtime.

## Your first Kubernetes commands

Check your cluster:

```bash
kubectl cluster-info
kubectl get nodes
kubectl get pods -A
```

## How Kubernetes works

1. Define your application's desired state.
2. Submit the configuration to Kubernetes.
3. Kubernetes schedules and runs the Pods.
4. Controllers work to maintain the desired state.

In this documentation, we'll use Minikube to run Kubernetes locally.

