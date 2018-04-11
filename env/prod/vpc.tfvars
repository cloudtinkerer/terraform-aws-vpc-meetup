#------------------------------------------
# Exercise #02 - PROD Environment
# Create an identical VPC in Tokyo region (ap-northeast-1)
# Add your answer below
#
# Exercise hint:
#
#   1. Create a new PROD workspace
#       terraform workspace new prod
#
#   2. Set the required variables (aws_region)
#
#   3. Run Terraform plan
#       terraform plan -var-file=env/prod/vpc.tfvars
#
#   4. Run Terraform apply
#       terraform apply -var-file=env/prod/vpc.tfvars
#
#------------------------------------------
//aws_region     = "change me"
vpc_cidr_block = "10.0.0.0/16"
