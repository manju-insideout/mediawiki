resource "kubernetes_service" "mediawiki" {
  metadata {
    name = "mediawiki-service"
  }
  spec {
    selector = {
      app = "mediawiki"
    }
    port {
      name = "http"
      port = 80
      target_port = 80
    }
  }
}

resource "kubernetes_service" "database" {
  metadata {
    name = "database-service"
  }
  spec {
    selector = {
      app = "database"
    }
    port {
      name = "postgres"
      port = 5432
      target_port = 5432
    }
  }
}
