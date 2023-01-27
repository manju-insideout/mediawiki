module "container_image" {
  source = "./modules/container-image"
  image_name = var.image_name
  image_tag = var.image_tag
}

module "k8s_deployment" {
  source = "./modules/k8s-deployment"
  deployment_name = var.deployment_name
  container_image = module.container_image.image
}

module "k8s_service" {
  source = "./modules/k8s-service"
  service_name = var.service_name
  deployment_name = module.k8s_deployment.deployment_name
}

provider "kubernetes" {
  config_path = var.k8s_config_path
}

resource "kubernetes_deployment" "main" {
  metadata {
    name = module.k8s_deployment.deployment_name
  }
  spec {
    template {
      metadata {
        labels = {
          app = module.k8s_deployment.deployment_name
        }
      }
      spec {
        container {
          image = module.container_image.image
          name  = module.k8s_deployment.deployment_name
        }
      }
    }
  }
}

resource "kubernetes_service" "main" {
  metadata {
    name = module.k8s_service.service_name
  }
  spec {
    selector {
      app = module.k8s_deployment.deployment_name
    }
    ports {
      name = "http"
      port = 80
      target_port = 80
    }
  }
}