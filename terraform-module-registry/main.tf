#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region = "ap-southeast-2"
}
#-------------------------------
# Terraform Module Registry - VPC
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/1.9.1
#  Third party module for creating VPC, subnets, route tables, etc.
#
# - terraform init
# - terraform plan
# - terraform apply
#
#-------------------------------
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-terraform-module-registry-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  public_subnets  =  ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
