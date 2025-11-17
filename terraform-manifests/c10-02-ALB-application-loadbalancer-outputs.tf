# INFO: LB Outputs

output "id" {
  description = "The ID of the load balancer"
  value       = aws_lb.application_load_balancer.id
}

output "arn" {
  description = "The ARN of the load balancer"
  value       = aws_lb.application_load_balancer.arn
}

output "arn_suffix" {
  description = "The ARN Suffix of the load balancer"
  value       = aws_lb.application_load_balancer.arn_suffix
}

output "lb_dns_name" {
  description = "The DNS Name of the load balancer"
  value       = aws_lb.application_load_balancer.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer"
  value       = aws_lb.application_load_balancer.zone_id
}

# INFO: Listeners Outputs

# INFO: HTTP Redirect

output "listeners_80_redirect" {
  description = "Map of listeners created and their attributes"
  value       = aws_lb_listener.application_load_balancer_80_redirect
  //sensitive   = true # NOTE: May or may not be sensitive. Listeners resource is giving diferent outputs than the module, skipping module related outputs.
}

# INFO: HTTPS Listener

output "listeners_443" {
  description = "Map of listeners created and their attributes"
  value       = aws_lb_listener.application_load_balancer_443
  //sensitive   = true # NOTE: May or may not be sensitive. Listeners resource is giving diferent outputs than the module, skipping module related outputs.
}

# INFO: Target Groups Outputs

# * SSL Termination at LB level. Out of scope for Terraform.

output "target_groups_80_app1" {
  description = "Map of target groups created and their attributes"
  value       = aws_lb_target_group.private_target_group_80_app1
}

# INFO: Application Load Balancer - Listener Rules

output "listener_rules_host_based_routing_app1" {
  description = "Host Based Routing for APP1"
  value       = aws_lb_listener_rule.host_based_routing_app1
}