#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region  = "${var.aws_region}"
}

#-------------------------------
# VPC resource
#-------------------------------
resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "my-terraform-aws-vpc-${terraform.workspace}"
    Environment = "${terraform.workspace}"
  }
}
