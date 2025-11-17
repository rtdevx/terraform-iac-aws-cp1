# INFO: Bastion Host Outputs

output "ec2_bastion_public_instance_ids" {
  description = "Instance ID of the Bastion Host"
  value       = aws_instance.myec2vm_bastion.id
}

output "ec2_bastion_public_ip" {
  description = "Public IP address of the Bastion Host"
  value       = aws_instance.myec2vm_bastion.public_ip
}

output "ec2_bastion_provate_ip" {
  description = "Private IP address of the Bastion Host"
  value       = aws_instance.myec2vm_bastion.private_ip
}