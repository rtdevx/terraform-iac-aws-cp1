# INFO: Local Values
# ? https://developer.hashicorp.com/terraform/language/block/locals
# ? slice Function used for AZ's: https://developer.hashicorp.com/terraform/language/functions/slice

data "aws_availability_zones" "available" {}
locals {
  owners      = var.business_divsion
  environment = var.environment
  name        = "${var.business_divsion}-${var.environment}"
  #name        = "${local.owners}-${local.environment}"

  azs = slice(data.aws_availability_zones.available.names, 0, 2)

  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}