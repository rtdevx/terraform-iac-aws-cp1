# INFO: Create EIP and attach it to Bastion Host
# ? https://registry.terraform.io/providers/-/aws/6.15.0/docs/resources/eip

resource "aws_eip" "myec2vm_bastion_eip" {
  depends_on = [aws_instance.myec2vm_bastion, module.vpc]
  instance   = aws_instance.myec2vm_bastion.id

  domain = "vpc"

  tags = local.common_tags
}

