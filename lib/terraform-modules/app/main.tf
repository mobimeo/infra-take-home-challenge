resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "app" {
  name      = "app"
  namespace = var.namespace
  atomic    = true
  chart     = "${path.module}/helm/chart/app"
  version   = "0.0.1"

  values = [
    file("${path.module}/helm/values.yaml")
  ]
}
