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

// Exercise 3 Answer - private subnet
resource "aws_subnet" "private_subnet" {
  #------------------------------------------------------------------------------------------------
  # Number of times this resource will be created based on the length of "private_subnet_cidr_block" list
  #   private_subnet_cidr_block = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  #------------------------------------------------------------------------------------------------
  count = "${length(var.private_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.private_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags {
    Name = "private_subnet_${count.index}"
  }
}

#-----------------------
# Internet Gateway
# Exercise: Run Terraform apply to create the Internet Gateway
#-----------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "internet_gateway_${terraform.workspace}"
  }
}

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

# Associates the route table to the public subnet
resource "aws_route_table_association" "public_rt_association" {
  count = "${length(aws_subnet.public_subnet.*.id)}"

  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

#-------------------------------------------
# Security Group - opening port 80 and 443
#-------------------------------------------
resource "aws_security_group" "sg_instance" {
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

#-------------------------------------------
# Create an EC2 instance below this comment block
# Reference: https://www.terraform.io/docs/providers/aws/r/instance.html
#
# Requirements:
#  - Use the security group provided above (see vpc_security_group_ids argument)
#     Note that this attribute requires a "list" input
#     Enclose it with brackets --> vpc_security_group_ids = ["${aws_security_group.sg_instance.id}"]
#
#  - "ami-fc41829e" - use this AMI ID with NGINX installed - (ami attribute)
#     This AMI can only be used in the Sydney region
#
#  - Specify any of the 3 PUBLIC subnet ID (see subnet_id argument)
#       Use the element interpolation and get the first item in the list
#       Reference: https://www.terraform.io/docs/configuration/interpolation.html#element-list-index-
#
#  - Associate a Public IP address (associate_public_ip_address)
#
#  - Create a "Name" tag - (tags)
#
#-------------------------------------------
