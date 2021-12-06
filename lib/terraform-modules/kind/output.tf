output "kubeconfig" {
  value = kind_cluster.cluster.kubeconfig
}

output "endpoint" {
  value = kind_cluster.cluster.endpoint
}

output "client_key" {
  value = kind_cluster.cluster.client_key
}

output "client_certificate" {
  value = kind_cluster.cluster.client_certificate
}

output "cluster_ca_certificate" {
  value = kind_cluster.cluster.cluster_ca_certificate
}
