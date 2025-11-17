# INFO: AWS SNS

# INFO: SNS - Topic
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic

resource "aws_sns_topic" "myasg_sns_topic" {
  name = "myasg-sns-topic"
}

# INFO: SNS - Subscription
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription

resource "aws_sns_topic_subscription" "myasg_sns_topic_subscription" {
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
  protocol  = "email"
  endpoint  = "career25@rkx.slmail.me"
}

# INFO: Create Autoscaling Notification Resource
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_notification

resource "aws_autoscaling_notification" "myasg_notifications" {
  group_names = [aws_autoscaling_group.my_asg.id]
  notifications = [

    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR"

  ]

  topic_arn = aws_sns_topic.myasg_sns_topic.arn

}