output "mediawiki_service_ip" {
  value = kubernetes_service.mediawiki.load_balancer_ingress.0.ip
}

output "database_service_ip" {
  value = kubernetes_service.database.load_balancer_ingress.0.ip
}
