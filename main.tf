## Ideally, this password should come from a secret store
locals {
  grafana_admin_password = "supersecure"
}

module "kind_cluster" {
  source       = "./lib/terraform-modules/kind"
  cluster_name = "test-cluster"
}

module "app" {
  source    = "./lib/terraform-modules/app"
  namespace = "app"
}

module "loki" {
  source = "./lib/terraform-modules/loki"
}

module "prometheus" {
  source                 = "./lib/terraform-modules/prometheus"
  grafana_admin_password = local.grafana_admin_password
}

module "nginx_ingress" {
  source = "./lib/terraform-modules/nginx-ingress"
  depends_on = [module.prometheus]
}

module "grafana_dashboard" {
  source     = "./lib/terraform-modules/grafana-dashboard"
  depends_on = [module.prometheus]
}
