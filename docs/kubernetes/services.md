---
title: Kubernetes Services
sidebar_position: 5
---

# Kubernetes Services

A Kubernetes Service provides stable network access to an application running in Pods.

## Service types

| Type | Description |
|---|---|
| ClusterIP | Internal cluster access |
| NodePort | Exposes a port on each node |
| LoadBalancer | Uses an external load balancer where supported |
| ExternalName | Maps a Service to a DNS name |

## Create a Deployment

```bash
kubectl create deployment nginx \
  --image=nginx:alpine
```

## Expose the Deployment

```bash
kubectl expose deployment nginx \
  --type=ClusterIP \
  --port=80 \
  --target-port=80
```

## List Services

```bash
kubectl get svc
```

## Access the application locally

```bash
kubectl port-forward svc/nginx 8080:80
```

Open:

http://localhost:8080

## Expose an application with NodePort

```bash
kubectl patch svc nginx \
  -p '{"spec":{"type":"NodePort"}}'
```

Access the Service through Minikube:

```bash
minikube service nginx --url
```

## Clean up

```bash
kubectl delete service nginx
kubectl delete deployment nginx
```

