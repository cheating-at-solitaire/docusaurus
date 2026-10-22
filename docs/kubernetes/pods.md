---
title: Kubernetes Pods
sidebar_position: 3
---

# Kubernetes Pods

A Pod is the smallest deployable unit in Kubernetes.

A Pod can contain one or more containers that share networking and storage resources.

## List Pods

```bash
kubectl get pods
```

List Pods across all namespaces:

```bash
kubectl get pods -A
```

## Create a test Pod

```bash
kubectl run nginx-test \
  --image=nginx:alpine \
  --port=80
```

## Check Pod status

```bash
kubectl get pods
```

## View Pod details

```bash
kubectl describe pod nginx-test
```

## View logs

```bash
kubectl logs nginx-test
```

## Access the container shell

```bash
kubectl exec -it nginx-test -- sh
```

Exit the shell using `exit`.

## Delete the test Pod

```bash
kubectl delete pod nginx-test
```

## Common Pod statuses

| Status | Meaning |
|---|---|
| Pending | Pod has not finished starting |
| Running | Pod is assigned to a node and running |
| Succeeded | All containers completed successfully |
| Failed | At least one container failed |
| CrashLoopBackOff | A container is repeatedly failing |
| ImagePullBackOff | Kubernetes cannot retrieve the image |

Some statuses such as CrashLoopBackOff are container waiting reasons rather than Pod phases.

