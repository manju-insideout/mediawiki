provider "kubernetes" {
  config_path = var.kubeconfig_path
  context = var.context
}

resource "kubernetes_deployment" "mediawiki" {
  metadata {
    name = var.mediawiki_deployment_name
    labels = var.mediawiki_deployment_labels
  }
  spec {
    replicas = var.mediawiki_replicas
    selector {
      match_labels = var.mediawiki_deployment_labels
    }
    template {
      metadata {
        labels = var.mediawiki_deployment_labels
      }
      spec {
        container {
          name = var.mediawiki_container_name
          image = var.mediawiki_image
          env {
            name = "MEDIAWIKI_DB_HOST"
            value = var.db_host
          }
          env {
            name = "MEDIAWIKI_DB_NAME"
            value = var.db_name
          }
          env {
            name = "MEDIAWIKI_DB_USER"
            value_from {
              config_map_key_ref {
                name = var.db_credentials_configmap_name
                key = "username"
              }
            }
          }
          env {
            name = "MEDIAWIKI_DB_PASSWORD"
            value_from {
              config_map_key_ref {
                name = var.db_credentials_configmap_name
                key = "password"
              }
            }
          }
          ports {
            name = var.mediawiki_port_name
            container_port = var.mediawiki_port
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "database" {
  metadata {
    name = var.database_deployment_name
    labels = {
      app = var.database_deployment_label
    }
  }
  spec {
    replicas = var.database_replicas
    selector {
      match_labels = {
        app = var.database_deployment_label
      }
    }
    template {
      metadata {
        labels = {
          app = var.database_deployment_label
        }
      }
      spec {
        container {
          name  = var.database_container_name
          image = var.database_image
          env {
            name = "DB_NAME"
            value = var.database_name
          }
          env {
            name = "DB_USER"
            value = var.database_username
          }
          env {
            name = "DB_PASS"
            value_from {
              config_map_key_ref {
                name = var.database_configmap
                key = "password"
              }
            }
          }
          ports {
            container_port = var.database_port
          }
        }
      }
    }
  }
}
