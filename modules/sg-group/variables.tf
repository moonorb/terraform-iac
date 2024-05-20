variable "vpc_id" {
  type = string
}

variable "resource_name_prefix" {
  type = string
}

variable "required_tags" {
  type = map(string)
}

variable "additional_ingress_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
