resource "helm_release" "prometheus_operator" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true

  values = [
    file("${path.module}/helm/values.yaml")
  ]

  set_sensitive {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
}
