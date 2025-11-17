# INFO: VPC Input Variables required by VPC module
# ? https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

# INFO: VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "myvpc"
}

# INFO: VPC CIDR Block
variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}