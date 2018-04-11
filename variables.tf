variable "aws_region" {
  description = "AWS Region"
}

variable "vpc_cidr_block" {
  description = "Main VPC CIDR Block"
}

variable "availability_zones" {
  type = "list"
  description = "AWS Region Availability Zones"
}

variable "public_subnet_cidr_block" {
  type = "list"
  description = "Public Subnet CIDR Block"
}

#-----------------------------------------------
# Exercise 03:
# Create a new PRIVATE subnet CIDR block variable below
# Name it "private_subnet_cidr_block"
#-----------------------------------------------

// Exercise 3 Answer - private subnet CIDR Block variable
variable "private_subnet_cidr_block" {
  type = "list"
  description = "Private Subnet CIDR Block"
}
