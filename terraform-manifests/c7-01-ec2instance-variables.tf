# INFO: EC2 Instance Types
variable "instance_type_bastion" {
  description = "EC2 Instance Type - Bastion"
  type        = string
  default     = "t3.nano"
}

variable "instance_type_private" {
  description = "EC2 Instance Type - AppServer"
  type        = string
  default     = "t3.micro"
}

# INFO: EC2 Instance Key Pair
variable "instance_keypair" {
  description = "EC2 Instance Key Pair associated with EC2 Instance"
  type        = string
  default     = "terraform-key"
}

# INFO: AWS EC2 Private Instance Count
variable "instance_count_private_app1" {
  description = "AWS EC2 Private Instances Count - APP1"
  type        = number
  default     = 1
}

variable "instance_count_private_app2" {
  description = "AWS EC2 Private Instances Count - APP2"
  type        = number
  default     = 1
}

variable "instance_count_private_app3" {
  description = "AWS EC2 Private Instances Count - APP3"
  type        = number
  default     = 1
}