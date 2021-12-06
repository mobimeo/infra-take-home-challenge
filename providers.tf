terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      version = "3.45.0"
    }
    kubernetes = {
      version = "2.1.0"
    }
    helm = {
      version = "2.1.2"
    }
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "1.16.0"
    }
  }
}

provider "kubernetes" {
  host                   = module.kind_cluster.endpoint
  client_key             = module.kind_cluster.client_key
  client_certificate     = module.kind_cluster.client_certificate
  cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = module.kind_cluster.endpoint
    client_key             = module.kind_cluster.client_key
    client_certificate     = module.kind_cluster.client_certificate
    cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
  }
}

provider "grafana" {
  url  = "http://localhost/grafana"
  auth = "admin:${local.grafana_admin_password}"
}
