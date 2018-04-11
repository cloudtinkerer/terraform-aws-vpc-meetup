#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region = "${var.aws_region}"
}

#-------------------------------
# VPC resource
#-------------------------------
resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name        = "my-terraform-aws-vpc-${terraform.workspace}"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_subnet" "public_subnet" {
  #------------------------------------------------------------------------------------------------
  # Number of times this resource will be created based on the length of "public_subnet_cidr_block" list
  #   public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  #------------------------------------------------------------------------------------------------
  count = "${length(var.public_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.public_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags {
    Name = "public_subnet_${count.index}"
  }
}

#-----------------------------------------------
# Exercise 03:
# Create a new PRIVATE aws_subnet
# Name it "private_subnet".
# Use the private_subnet_cidr_block you created
# Don't forget to change the TAG
#-----------------------------------------------

