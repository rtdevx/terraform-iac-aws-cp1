# INFO: Get Route53 DNS Zone Information
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone.html

# INFO: Data

data "aws_route53_zone" "hosted_zone" {
  name         = "aws.skynetx.uk" # FIX: Should be a variable in "c12-01-route53-dnsregistration-variables.tf"
  private_zone = false
}

# INFO: Outputs
# Output hosted_zone Zone ID
output "hosted_zone_zoneid" { # NOTE: Required for Domain Validation
  description = "The Hosted Zone id of the desired Hosted Zone"
  value       = data.aws_route53_zone.hosted_zone.zone_id
}

# Output hosted_zone name
output "hosted_zone_name" {
  description = " The Hosted Zone name of the desired Hosted Zone."
  value       = data.aws_route53_zone.hosted_zone.name
}