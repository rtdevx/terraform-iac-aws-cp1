# INFO: Create null_resource (terraform provisioner)
# ? https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource
# ! On Terraform 1.4 and later, use the terraform_data resource type instead: 
# * https://developer.hashicorp.com/terraform/language/resources/terraform-data
# * https://developer.hashicorp.com/terraform/language/provisioners
# @critical: Terraform Provisioners are the last resort, use only if other methods (user_data / AWS CodeArtifact) are not available.

/* # Skipping Nullresource Provisioner for now.

# INFO: Create a Null Resource and Provisioners
resource "null_resource" "myec2vm_bastion" {
  depends_on = [aws_instance.myec2vm_bastion]

  # INFO: Connection Block for Provisioners to connect to EC2 Instance
  # * https://developer.hashicorp.com/terraform/language/provisioners#connect-to-remote-resources

  connection {
    type        = "ssh"
    host        = aws_eip.myec2vm_bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/terraform-key.pem")
  }

  # INFO: File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  # * https://developer.hashicorp.com/terraform/language/provisioners#file

  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }

  # INFO: Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  # * https://developer.hashicorp.com/terraform/language/provisioners#remote-exec

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }

*/ #Skipping Nullresource Provisioner for now.

  /*

  # INFO: Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  # * https://developer.hashicorp.com/terraform/language/provisioners#local-exec

  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }

*/

  # INFO: Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)

  # NOTE: Creation Time Provisioners - By default they are created during resource creations (terraform apply)
  # NOTE: Destroy Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)

  /*  
    provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }  
*/

//}

