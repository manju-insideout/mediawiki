output "database_endpoint" {
  value = kubernetes_service.database.spec.cluster_ip
}
output "database_deployment_name" {
  value = kubernetes_deployment.database.metadata.name
}
output "database_pod_name" {
  value = kubernetes_pod.database.*.metadata.name
}
