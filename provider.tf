provider "kubernetes" {
  config_path = var.kube_config_path
}

provider "docker" {
  host = var.docker_host
}
