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
