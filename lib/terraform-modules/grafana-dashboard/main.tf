resource "grafana_dashboard" "app" {
  config_json = file("${path.module}/grafana-dashboard.json")
}
