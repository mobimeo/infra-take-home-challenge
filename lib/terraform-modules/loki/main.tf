
resource "helm_release" "loki" {
  name             = "loki"
  namespace        = var.namespace
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki"
  create_namespace = true

  values = [
    file("${path.module}/helm/values.yaml")
  ]
}

variable "namespace" {
  type = string
  validation {
    condition     = can(regex("^[a-z-]+$", var.namespace))
    error_message = "Namespace name must be a word."
  }
}
