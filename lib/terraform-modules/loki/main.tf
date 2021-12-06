resource "helm_release" "loki" {
  name             = "loki"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki-stack"
  namespace        = var.namespace
  create_namespace = true

  values = [
    file("${path.module}/helm/values.yaml")
  ]
}
