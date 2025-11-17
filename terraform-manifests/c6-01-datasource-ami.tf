# INFO: Get the latest AWS AMI ID for Amazon2 Linux
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#example-usage

data "aws_ami" "amzlinux2" {
  #  executable_users = ["self"]
  most_recent = true
  #  name_regex       = "^myami-[0-9]{3}"
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}