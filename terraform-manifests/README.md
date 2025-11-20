---
title: Terraform IaC DevOps using AWS CodePipeline
description: Create AWS CodePipeline with Multiple Environments Dev and Staging
---
# IaC DevOps using AWS CodePipeline

## Introduction
1. Terraform Backend with backend-config
2. How to create multiple environments related Pipeline with single TF Config files in Terraform ? 
3. As part of Multiple environments we are going to create `dev` and `stag` environments
4. We are going build IaC DevOps Pipelines using 
- AWS CodeBuild
- AWS CodePipeline
- Github
5. We are going to streamline the `terraform-manifests` taken from `section-15` and streamline that to support Multiple environments.

[![Image](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-1.png "Terraform on AWS with IAC DevOps and SRE")](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-1.png)

[![Image](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-2.png "Terraform on AWS with IAC DevOps and SRE")](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-2.png)

[![Image](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-3.png "Terraform on AWS with IAC DevOps and SRE")](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-3.png)

[![Image](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-4.png "Terraform on AWS with IAC DevOps and SRE")](https://stacksimplify.com/course-images/terraform-aws-codepipeline-iac-devops-4.png)

## CI/CD

### Backend Config

```shell
  # INFO: S3 Backend Block
  backend "s3" {
    # NOTE: Backend configuration moved to 'env_ENVIRONMENT.conf' files to support multiple environments.
    # NOTE: Executing backend configuration within CI/CD pipeline `terraform init -backend-config=env_dev.conf` or `terraform init -backend-config=env_stag.conf`
    # ? https://developer.hashicorp.com/terraform/cli/commands/init
  }
}
```

### CI/CD command

In order to include backend config and point env-related variables:

```shell
terraform init -backend-config=env_dev.conf 
terraform plan -var-file=dev.tfvars
terraform apply -input=false -var-file=env_dev.tfvars -auto-approve
```

## Original repo

https://github.com/stacksimplify/terraform-on-aws-ec2/blob/main/22-IaC-DevOps-using-AWS-CodePipeline/README.md

## References
- [terraform init command](https://www.terraform.io/docs/cli/commands/init.html)
- [Backend configuration partial](https://developer.hashicorp.com/terraform/language/backend#partial-configuration)
- [AWS CodeBuild Builspe file reference](https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env)

## Disclaimer

This series draws heavily from **Kalyan Reddy Daida**’s [Terraform on AWS with SRE & IaC DevOps](https://www.udemy.com/course/terraform-on-aws-with-sre-iac-devops-real-world-demos/) course on Udemy.

[His content](https://www.udemy.com/user/kalyan-reddy-9/) was a game-changer in helping me understand Terraform.

<!-- About the instructor -->

<table>
  <thead>
      <tr>
          <th>About the instructor</th>
          <th></th>
      </tr>
  </thead>
  <tbody>
      <tr>
          <td>🌐 <a href="https://stacksimplify.com/" target="_blank" rel="noreferrer">Website</a>
</td>
          <td>📺 <a href="http://www.youtube.com/stacksimplify" target="_blank" rel="noreferrer">YouTube</a>
</td>
      </tr>
      <tr>
          <td>💼 <a href="http://www.linkedin.com/in/kalyan-reddy-daida" target="_blank" rel="noreferrer">LinkedIn</a>
</td>
          <td>🗃️ <a href="https://github.com/stacksimplify" target="_blank" rel="noreferrer">GitHub</a>
</td>
      </tr>
  </tbody>
</table>

<!-- /About the instructor -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 6.4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_autoscaling_attachment.my_asg_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.my_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_notification.myasg_notifications](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_notification) | resource |
| [aws_autoscaling_policy.alb_target_requests_greater_than_yy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.avg_cpu_policy_greater_than_xx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_schedule.decrease_capacity_5pm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.increase_capacity_7am](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_eip.myec2vm_bastion_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.myec2vm_bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_launch_template.my_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.application_load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.application_load_balancer_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.application_load_balancer_80_redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.host_based_routing_app1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.private_target_group_80_app1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.demo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.private-egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private-ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private-web-80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private-web-8080](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private-web-alb-egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private-web-alb-web-443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private-web-alb-web-80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.public-bastion-egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.public-bastion-ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sns_topic.myasg_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.myasg_sns_topic_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_vpc_security_group_egress_rule.bastion-allow-all-traffic_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.private-allow-all-traffic_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.private-web-alb-allow-all-traffic_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.private-ssh_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.private-web-8080_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.private-web-80_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.private-web-alb-web-443_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.private-web-alb-web-80_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.public-bastion-ssh_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [null_resource.myec2vm_bastion](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_ami.amzlinux2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_route53_zone.hosted_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region in which AWS Resources will be created | `string` | `"eu-west-2"` | no |
| <a name="input_business_division"></a> [business\_divsion](#input\_business\_divsion) | Business Division in the large organization this Infrastructure belongs | `string` | `"Operations"` | no |
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | DNS Name to support multiple environments | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment Variable used as a prefix | `string` | `"DEV"` | no |
| <a name="input_instance_count_private_app1"></a> [instance\_count\_private\_app1](#input\_instance\_count\_private\_app1) | AWS EC2 Private Instances Count - APP1 | `number` | `1` | no |
| <a name="input_instance_count_private_app2"></a> [instance\_count\_private\_app2](#input\_instance\_count\_private\_app2) | AWS EC2 Private Instances Count - APP2 | `number` | `1` | no |
| <a name="input_instance_count_private_app3"></a> [instance\_count\_private\_app3](#input\_instance\_count\_private\_app3) | AWS EC2 Private Instances Count - APP3 | `number` | `1` | no |
| <a name="input_instance_keypair"></a> [instance\_keypair](#input\_instance\_keypair) | EC2 Instance Key Pair associated with EC2 Instance | `string` | `"terraform-key"` | no |
| <a name="input_instance_type_bastion"></a> [instance\_type\_bastion](#input\_instance\_type\_bastion) | EC2 Instance Type - Bastion | `string` | `"t3.nano"` | no |
| <a name="input_instance_type_private"></a> [instance\_type\_private](#input\_instance\_type\_private) | EC2 Instance Type - AppServer | `string` | `"t3.micro"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR Block | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC Name | `string` | `"myvpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the load balancer |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | The ARN Suffix of the load balancer |
| <a name="output_autoscaling_group_arn"></a> [autoscaling\_group\_arn](#output\_autoscaling\_group\_arn) | Autoscaling Group ARN |
| <a name="output_autoscaling_group_id"></a> [autoscaling\_group\_id](#output\_autoscaling\_group\_id) | Autoscaling Group ID |
| <a name="output_autoscaling_group_name"></a> [autoscaling\_group\_name](#output\_autoscaling\_group\_name) | Autoscaling Group Name |
| <a name="output_azs"></a> [azs](#output\_azs) | A list of availability zones specified as argument to this module |
| <a name="output_database_subnet_group"></a> [database\_subnet\_group](#output\_database\_subnet\_group) | ID of database subnet group |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of database subnets |
| <a name="output_database_subnets_cidr_blocks"></a> [database\_subnets\_cidr\_blocks](#output\_database\_subnets\_cidr\_blocks) | List of cidr\_blocks of database subnets |
| <a name="output_dns_lb_demo"></a> [dns\_lb\_demo](#output\_dns\_lb\_demo) | Load Balancer app1 DNS name |
| <a name="output_ec2_bastion_provate_ip"></a> [ec2\_bastion\_provate\_ip](#output\_ec2\_bastion\_provate\_ip) | Private IP address of the Bastion Host |
| <a name="output_ec2_bastion_public_instance_ids"></a> [ec2\_bastion\_public\_instance\_ids](#output\_ec2\_bastion\_public\_instance\_ids) | Instance ID of the Bastion Host |
| <a name="output_ec2_bastion_public_ip"></a> [ec2\_bastion\_public\_ip](#output\_ec2\_bastion\_public\_ip) | Public IP address of the Bastion Host |
| <a name="output_hosted_zone_name"></a> [hosted\_zone\_name](#output\_hosted\_zone\_name) | The Hosted Zone name of the desired Hosted Zone. |
| <a name="output_hosted_zone_zoneid"></a> [hosted\_zone\_zoneid](#output\_hosted\_zone\_zoneid) | The Hosted Zone id of the desired Hosted Zone |
| <a name="output_id"></a> [id](#output\_id) | The ID of the load balancer |
| <a name="output_launch_template_id"></a> [launch\_template\_id](#output\_launch\_template\_id) | Launch Template ID |
| <a name="output_launch_template_latest_version"></a> [launch\_template\_latest\_version](#output\_launch\_template\_latest\_version) | Launch Template Latest Version |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | The DNS Name of the load balancer |
| <a name="output_listener_rules_host_based_routing_app1"></a> [listener\_rules\_host\_based\_routing\_app1](#output\_listener\_rules\_host\_based\_routing\_app1) | Host Based Routing for APP1 |
| <a name="output_listeners_443"></a> [listeners\_443](#output\_listeners\_443) | Map of listeners created and their attributes |
| <a name="output_listeners_80_redirect"></a> [listeners\_80\_redirect](#output\_listeners\_80\_redirect) | Map of listeners created and their attributes |
| <a name="output_private_nat_gateway_route_ids"></a> [private\_nat\_gateway\_route\_ids](#output\_private\_nat\_gateway\_route\_ids) | List of IDs of the private nat gateway route |
| <a name="output_private_ssh_sg_group_id"></a> [private\_ssh\_sg\_group\_id](#output\_private\_ssh\_sg\_group\_id) | The ID of the security group |
| <a name="output_private_ssh_sg_group_name"></a> [private\_ssh\_sg\_group\_name](#output\_private\_ssh\_sg\_group\_name) | The name of the security group |
| <a name="output_private_ssh_sg_group_vpc_id"></a> [private\_ssh\_sg\_group\_vpc\_id](#output\_private\_ssh\_sg\_group\_vpc\_id) | The VPC ID |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_private_web80_group_id"></a> [private\_web80\_group\_id](#output\_private\_web80\_group\_id) | The ID of the security group |
| <a name="output_private_web80_sg_group_name"></a> [private\_web80\_sg\_group\_name](#output\_private\_web80\_sg\_group\_name) | The name of the security group |
| <a name="output_private_web80_sg_group_vpc_id"></a> [private\_web80\_sg\_group\_vpc\_id](#output\_private\_web80\_sg\_group\_vpc\_id) | The VPC ID |
| <a name="output_public_bastion_ssh_sg_group_id"></a> [public\_bastion\_ssh\_sg\_group\_id](#output\_public\_bastion\_ssh\_sg\_group\_id) | The ID of the security group |
| <a name="output_public_bastion_ssh_sg_group_name"></a> [public\_bastion\_ssh\_sg\_group\_name](#output\_public\_bastion\_ssh\_sg\_group\_name) | The name of the security group |
| <a name="output_public_bastion_ssh_sg_group_vpc_id"></a> [public\_bastion\_ssh\_sg\_group\_vpc\_id](#output\_public\_bastion\_ssh\_sg\_group\_vpc\_id) | The VPC ID |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | List of cidr\_blocks of public subnets |
| <a name="output_target_groups_80_app1"></a> [target\_groups\_80\_app1](#output\_target\_groups\_80\_app1) | Map of target groups created and their attributes |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The zone\_id of the load balancer |
<!-- END_TF_DOCS -->