# INFO: Create Ingress Security Group - SSH Traffic
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#example-usage

resource "aws_security_group" "public-bastion-ssh" {
  name        = "${local.name}-public-bastion-ssh"
  description = "Security Group for Public Bastion Host - SSH Access"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags
}

resource "aws_vpc_security_group_ingress_rule" "public-bastion-ssh_ipv4" {
  description       = "Allow Port 22 INBOUND - PUBLIC"
  security_group_id = aws_security_group.public-bastion-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = local.common_tags
}

# INFO: Create Egress Security Group - ALL

resource "aws_security_group" "public-bastion-egress" {
  name        = "${local.name}-public-bastion-egress"
  description = "Security Group for Public Bastion Host - ALL OUTBOUND"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags
}

resource "aws_vpc_security_group_egress_rule" "bastion-allow-all-traffic_ipv4" {
  description       = "Allow all IP and ports OUTBOUND"
  security_group_id = aws_security_group.public-bastion-egress.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = local.common_tags
}