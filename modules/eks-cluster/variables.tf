
variable "region" {
  type = string
 # default = "us-east-1"
}

variable "cluster_name" {
  type = string
  default = "dev-cluster"
}

variable "cluster_version" {
  type = string
  default = "1.29"
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}


variable "managed_node_groups" {
  type = map(any)
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "required_tags" {
  type = map(string)
}

variable "argocd_ingress_enabled" {
  type    = bool
  default = false
}

variable "argocd_ingress_class_name" {
  type    = string
  default = ""
}

variable "argocd_ingress_annotations" {
  type    = map(string)
  default = {}
}

variable "argocd_ingress_hosts" {
  type    = list(string)
  default = []
}

variable "argocd_path_ssl_redirect" {
  type    = bool
  default = false
}

variable "custom_security_group" {
  type    = string
  default = ""
}