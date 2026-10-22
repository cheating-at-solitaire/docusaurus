---
title: kubectl Command Reference
sidebar_position: 7
---

# kubectl Command Reference

A quick reference for managing Kubernetes clusters.

## Cluster information

```bash
kubectl cluster-info
kubectl get nodes
kubectl config current-context
kubectl config get-contexts
```

## Pods

```bash
kubectl get pods
kubectl get pods -A
kubectl get pods -o wide
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs -f POD_NAME
```

## Deployments

```bash
kubectl get deployments
kubectl describe deployment NAME
kubectl rollout status deployment/NAME
kubectl rollout restart deployment/NAME
kubectl rollout undo deployment/NAME
```

## Services and Ingress

```bash
kubectl get svc
kubectl get ingress
kubectl get endpointslices
```

## Namespaces

```bash
kubectl get namespaces
kubectl create namespace development
kubectl get pods -n development
```

## Debugging

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl describe pod POD_NAME
kubectl logs POD_NAME --previous
```

## Resource usage

If Metrics Server is installed:

```bash
kubectl top nodes
kubectl top pods
```

## Minikube commands

```bash
minikube status
minikube dashboard
minikube addons list
minikube image ls
minikube stop
minikube start
```

## Important

Replace `POD_NAME` and `NAME` with the actual resource names.

For resources outside the default namespace, add `-n NAMESPACE`.

