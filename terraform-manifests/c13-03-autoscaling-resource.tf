# INFO: AWS Auto Scaling Group
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

resource "aws_autoscaling_group" "my_asg" {

  # ! Depends on VPC to be created first. Required for NAT GW to be present in order to run user_data.
  # ! Depends on ALB to be created first. Required for LB Target Groups to be present so it can attach to them.
  depends_on = [module.vpc, aws_lb.application_load_balancer]

  name_prefix               = "${local.name}-"
  desired_capacity          = 1
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2" # ? "EC2" or "ELB". Controls how health checking is done. Difference between EC2 and ELB?
  vpc_zone_identifier       = module.vpc.private_subnets

  target_group_arns = aws_lb_target_group.private_target_group_80_app1.load_balancer_arns

  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      instance_warmup        = 300 # NOTE: Default is to use `aws_autoscaling_group.my_asg.health_check_grace_period`
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"] # NOTE: Any argument from ASG here, if those change, ASG Instance Refresh will trigger
  }

  # INFO: Define Resource lifecycle
  # ! Must be applied, otherwise "Error: attaching Auto Scaling Group / Provided Target Groups may not be valid"
  # ? https://developer.hashicorp.com/terraform/tutorials/state/resource-lifecycle

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [target_group_arns]
  }

  # INFO: Define tags
  tag {
    key                 = local.owners
    value               = local.name
    propagate_at_launch = true
  }

}