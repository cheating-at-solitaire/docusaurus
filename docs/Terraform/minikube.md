---
title: Terraform with Minikube
sidebar_position: 7
---

# Deploying to Minikube with Terraform

This guide demonstrates how Terraform can manage resources inside a local Kubernetes cluster.

## Prerequisites

Make sure Docker, Minikube, kubectl and Terraform are installed.

Check:

```bash
docker --version
minikube version
kubectl version --client
terraform version
```

## Start Minikube

```bash
minikube start --driver=docker
```

Verify the cluster:

```bash
kubectl get nodes
kubectl config current-context
```

The current context should be `minikube`.

## Create a Terraform project

```bash
mkdir -p ~/projects/terraform-minikube-demo
cd ~/projects/terraform-minikube-demo
```

## Configure the Kubernetes provider

Create `providers.tf`:

```hcl
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = pathexpand("~/.kube/config")
  config_context = "minikube"
}
```

## Create a namespace

In `main.tf`:

```hcl
resource "kubernetes_namespace_v1" "demo" {
  metadata {
    name = "terraform-demo"
  }
}
```

## Create an Nginx Deployment

Add to `main.tf`:

```hcl
resource "kubernetes_deployment_v1" "nginx" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace_v1.demo.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:alpine"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
```

## Create a Service

Add to `main.tf`:

```hcl
resource "kubernetes_service_v1" "nginx" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace_v1.demo.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
```

## Initialise Terraform

```bash
terraform init
```

## Format and validate

```bash
terraform fmt
terraform validate
```

## Preview resources

```bash
terraform plan
```

## Apply configuration

```bash
terraform apply
```

Confirm with `yes`.

## Verify the Deployment

```bash
kubectl get all -n terraform-demo
```

Check Pods:

```bash
kubectl get pods -n terraform-demo
```

Wait for the Deployment:

```bash
kubectl rollout status deployment/nginx -n terraform-demo
```

## Access Nginx

Forward the Service to your local machine:

```bash
kubectl port-forward -n terraform-demo svc/nginx 8080:80
```

Open:

http://localhost:8080

You should see the Nginx welcome page.

## Clean up

Stop port forwarding with Ctrl+C.

Remove the Terraform-managed resources:

```bash
terraform destroy
```

Review the destroy plan and confirm.

## Next step

Replace the Nginx container with your own Docusaurus container image and configure a Service to expose your documentation website.

When using locally built images, ensure they are available to Minikube and choose an appropriate image pull policy.
EOF

