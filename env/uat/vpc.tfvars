#------------------------------------------
# Exercise #02 - UAT Environment
# Create an identical VPC in Oregon region (us-west-2)
# Add your answer below
#
# Exercise hint:
#
#   1. Create a new UAT workspace
#       terraform workspace new uat
#
#   2. Set the required variables (aws_region)
#
#   3. Run Terraform plan
#       terraform plan -var-file=env/uat/vpc.tfvars
#
#   4. Run Terraform apply
#       terraform apply -var-file=env/uat/vpc.tfvars
#
#------------------------------------------
//aws_region     = "change me"
vpc_cidr_block = "10.0.0.0/16"
