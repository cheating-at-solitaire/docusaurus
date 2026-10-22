---
title: Kubernetes Ingress
sidebar_position: 6
---

# Kubernetes Ingress

Ingress routes incoming HTTP and HTTPS traffic to Services inside Kubernetes.

An Ingress controller must be installed for Ingress rules to work.

## Enable Ingress in Minikube

```bash
minikube addons enable ingress
```

Check the controller:

```bash
kubectl get pods -n ingress-nginx
```

## Example Ingress configuration

Create `ingress.yaml`:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: docusaurus
  namespace: docusaurus
spec:
  ingressClassName: nginx
  rules:
    - host: docs.local
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: docusaurus
                port:
                  number: 80
```

This example assumes a `docusaurus` Service exists in the `docusaurus` namespace.

## Apply the Ingress

```bash
kubectl apply -f ingress.yaml
```

## Check Ingress resources

```bash
kubectl get ingress -A
```

## Access using a hostname

The hostname `docs.local` must resolve to the address where your Ingress controller is reachable.

On Minikube, this depends on your driver and networking setup. With Docker Desktop and WSL2, additional networking configuration may be necessary.

## Terraform-managed Ingress

If Terraform manages your Kubernetes infrastructure, define the Ingress using the `kubernetes_ingress_v1` resource rather than manually applying YAML.

