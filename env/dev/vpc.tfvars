#------------------------------------------
# DEV Environment Demo
#
#   1. Create a new DEV workspace
#       terraform workspace new dev
#
#   2. Set the required variables (aws_region)  Sydney region "ap-southeast-2"
#
#   3. Run Terraform plan
#       terraform plan -var-file=env/dev/vpc.tfvars
#
#   4. Run Terraform apply
#       terraform apply -var-file=env/dev/vpc.tfvars
#
#------------------------------------------
aws_region     = "ap-southeast-2"
vpc_cidr_block = "10.0.0.0/16"

availability_zones = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]

# Public Subnet
public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

#-----------------------------------------------
# Exercise 03:
# Create a new PRIVATE subnet CIDR block ranges
#   Name it "private_subnet_cidr_block"
#-----------------------------------------------