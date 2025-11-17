# INFO: Domain Registration
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

resource "aws_route53_record" "demo" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.dns_name
  type    = "A"

  alias {
    name                   = aws_lb.application_load_balancer.dns_name
    zone_id                = aws_lb.application_load_balancer.zone_id
    evaluate_target_health = true
  }
}