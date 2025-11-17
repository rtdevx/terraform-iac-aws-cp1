# INFO: Create Ingress Security Group for the Application Load Balancer
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

# INFO: Create Ingress Security Group - WEB Traffic - 80

resource "aws_security_group" "private-web-alb-web-80" {
  name        = "${local.name}-private-web-alb-web-80"
  description = "Security Group for Private ALB - WEB Traffic Port 80"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "private-web-alb-web-80"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private-web-alb-web-80_ipv4" {
  description       = "Allow Port 80 INBOUND"
  security_group_id = aws_security_group.private-web-alb-web-80.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    "Name" = "private-web-alb-web-inbound-80"
  }
}

# INFO: Create Ingress Security Group - WEB Traffic - 443

resource "aws_security_group" "private-web-alb-web-443" {
  name        = "${local.name}-private-web-alb-web-443"
  description = "Security Group for Private ALB - WEB Traffic Port 443"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "private-web-alb-web-443"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private-web-alb-web-443_ipv4" {
  description       = "Allow Port 443 INBOUND"
  security_group_id = aws_security_group.private-web-alb-web-443.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

  tags = {
    "Name" = "private-web-alb-web-inbound-443"
  }
}

# INFO: Create Egress Security Group - ALL

resource "aws_security_group" "private-web-alb-egress" {
  name        = "${local.name}-private-web-alb-egress"
  description = "Security Group for Private ALB - ALL OUTBOUND"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags
}

resource "aws_vpc_security_group_egress_rule" "private-web-alb-allow-all-traffic_ipv4" {
  description       = "Allow all IP and ports OUTBOUND"
  security_group_id = aws_security_group.private-web-alb-egress.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = local.common_tags
}