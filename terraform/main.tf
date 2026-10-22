resource "kubernetes_namespace_v1" "docs" {
  metadata {
    name = "docusaurus"
  }
}

resource "kubernetes_deployment_v1" "docs" {
  metadata {
    name      = "docusaurus"
    namespace = kubernetes_namespace_v1.docs.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "docusaurus"
      }
    }

    template {
      metadata {
        labels = {
          app = "docusaurus"
        }
      }

      spec {
        container {
          name              = "docusaurus"
          image             = "docusaurus:v1"
          image_pull_policy = "Never"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "docs" {
  metadata {
    name      = "docusaurus"
    namespace = kubernetes_namespace_v1.docs.metadata[0].name
  }

  spec {
    selector = {
      app = "docusaurus"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
