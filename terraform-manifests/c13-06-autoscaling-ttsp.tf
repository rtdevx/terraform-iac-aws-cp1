# INFO: Target Tracking Scaling Policies
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy

# INFO: TTS - Scaling Policy-1: Based on CPU Utilization

resource "aws_autoscaling_policy" "avg_cpu_policy_greater_than_xx" {
  name                      = "${local.name}-avg-cpu-policy-greater-than-xx"
  policy_type               = "TargetTrackingScaling" # NOTE: Default "SimpleScaling."
  estimated_instance_warmup = 120

  autoscaling_group_name = aws_autoscaling_group.my_asg.id

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0 # NOTE: CPU Utilization above 50%

  }
}

# INFO: TTS - Scaling Policy-2: Based on ALB Target Requests

resource "aws_autoscaling_policy" "alb_target_requests_greater_than_yy" {
  depends_on = [ aws_autoscaling_group.my_asg ] # NOTE: Ensure ASG is created before this policy due to API errors during initiatal apply.
  name        = "${local.name}-alb-target-requests-greater-than-yy"
  policy_type = "TargetTrackingScaling" # NOTE: Default "SimpleScaling."

  autoscaling_group_name = aws_autoscaling_group.my_asg.id
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "${aws_lb.application_load_balancer.arn_suffix}/${aws_lb_target_group.private_target_group_80_app1.arn_suffix}"
    }

    target_value = 10.0 # NOTE: Number of requests > 10 completed per target in an Application Load Balancer target group.
  }
}