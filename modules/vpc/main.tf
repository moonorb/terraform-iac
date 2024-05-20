data "aws_availability_zones" "available" {}

locals {
   azs      = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
  cidr = var.vpc_cidr
  name = var.vpc_name
  azs               = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 48)]
  enable_nat_gateway = true
  single_nat_gateway = true
  create_database_subnet_group           = false
  create_database_subnet_route_table     = false
  create_database_internet_gateway_route = false
  enable_dns_hostnames = true
  enable_dns_support   = true

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  tags = var.required_tags 
}