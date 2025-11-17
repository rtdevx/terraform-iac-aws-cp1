# INFO: Environment specific variables

# INFO: Environment
environment = "dev"

# INFO: VPC Variables
vpc_name = "myvpc"
vpc_cidr = "10.0.0.0/16"

# INFO: EC2 Instance Variables
instance_type_bastion = "t3.nano"
instance_type_private = "t3.micro"
instance_keypair      = "terraform-key"
//private_instance_count = 2 # NOTE: Probably not needed as ASG will manage this.

# INFO: DNS Name
//dns_name = "demo-${var.environment}.${data.aws_route53_zone.hosted_zone.name}"
dns_name = "dev.aws.skynetx.uk"

