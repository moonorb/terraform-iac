variable "aws_region" {
  description = "Name of your Region"
  type        = string
}

variable "vpc_name" {
  description = "Name of your VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR Range for VPC"
  type        = string
}

variable "required_tags" {
  type = map(string)
  description = "Tags to Identify the Resource"
}