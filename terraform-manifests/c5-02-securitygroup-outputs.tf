# INFO: Public Bastion Host Security Group Outputs

# INFO: public_bastion_ssh_sg_group_vpc_id
output "public_bastion_ssh_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = aws_security_group.public-bastion-ssh.vpc_id
}

# INFO: public_bastion_ssh_sg_group_id
output "public_bastion_ssh_sg_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.public-bastion-ssh.id
}

# INFO: public_bastion_ssh_sg_group_name
output "public_bastion_ssh_sg_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.public-bastion-ssh.name
}

# INFO: Private EC2 Instances Security Group Outputs

# INFO: SSH Groups

output "private_ssh_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = aws_security_group.private-ssh.vpc_id
}

output "private_ssh_sg_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.private-ssh.id
}

output "private_ssh_sg_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.private-ssh.name
}

# INFO: WEB Traffic - 80 Groups

output "private_web80_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = aws_security_group.private-web-80.vpc_id
}

output "private_web80_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.private-web-80.id
}

output "private_web80_sg_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.private-web-80.name
}

/*

# * Only HTTP ports. SSL Termination at LB level. Out of scope for Terraform.

# INFO: WEB Traffic - 443 Groups

output "private_web443_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = aws_security_group.private-web-443.vpc_id
}

output "private_web443_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.private-web-443.id
}

output "private_web443_sg_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.private-web-443.name
}

*/