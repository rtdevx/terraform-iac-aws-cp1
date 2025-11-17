# INFO: Create VPC using Terraform Module
# ? https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.4.0"

  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr

  azs = local.azs

  private_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  public_subnets   = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 4)]
  database_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 8)]

  create_database_subnet_group       = true
  create_database_subnet_route_table = true

  enable_nat_gateway = true
  single_nat_gateway = true # NOTE: Only in non-prod regions.

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
}

