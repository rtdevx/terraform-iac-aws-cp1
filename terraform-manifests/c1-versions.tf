# INFO: Terraform Block
# ? https://registry.terraform.io/providers/hashicorp/aws/latest/docs#example-usage

terraform {
  required_version = "~> 1.13.0" # NOTE: Greater than 1.13.2. Only the most upright version number (.0) can change.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # NOTE: Greater than 6.0. Only the most upright version number (.0) can change.
    }
  }

  # INFO: S3 Backend Block
  backend "s3" {
    # NOTE: Backend configuration moved to 'env_ENVIRONMENT.conf' files to support multiple environments.
    # NOTE: Executing backend configuration within CI/CD pipeline `terraform init -backend-config=env_dev.conf` or `terraform init -backend-config=env_stag.conf`
    # ? https://developer.hashicorp.com/terraform/cli/commands/init
  }
}

# INFO: Provider Block
provider "aws" {
  region  = var.aws_region
  # NOTE: Profile only required when running Terraform locally on your desktop/laptop. CodePipeline will use Parameters defined in the Parameter Store.
  //profile = "default" # NOTE: AWS Credentials Profile (profile = "default") configured on your local desktop terminal ($HOME/.aws/credentials)
} 