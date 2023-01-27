variable "kubeconfig_path" {
type = string
default = 1
}

variable "mediawiki_deployment_name" {
type = string
default = 1
}

variable "mediawiki_deployment_labels" {
type = string
default = "mediawiki:latest"
}

variable "mediawiki_replicas" {
default = 80
}

variable "mediawiki_container_name" {
type = string
default = 80
}

variable "mediawiki_image" {
type = string
default = "mysql"
}

variable "db_host" {
default = "mysql"
}

variable "db_name" {
type = string
default = "mediawiki"
}

variable "db_credentials_configmap_name" {
type = string
default = "my_secret_password"
}

variable "mediawiki_port_name" {
default = "mediawiki"
}

variable "database_deployment_name" {

  type = string
}

variable "database_deployment_label" {
  type = number
  default = 1
}

variable "database_image" {
default = "mediawiki"
}

variable "database_name" {
  type = string
}

variable "database_username" {
default = "mediawiki"
}

variable "database_configmap" {
  type = string
}

variable "database_port" {
default = "mediawiki"
}
