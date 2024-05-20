locals {
  name_prefix = "acount-b"
}

data "terraform_remote_state" "account_a" {
  backend = "s3"

  config = {
    bucket = var.remote_state_account_a.bucket
    key    = var.remote_state_account_a.key
    region = var.remote_state_account_a.region
  }
}

###############################################################################
# VPC
###############################################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = local.name_prefix
  cidr = var.vpc.cidr

  azs             = var.azs
  private_subnets = var.vpc.private_subnets

  enable_nat_gateway = false
}

###############################################################################
# Transit Gateway
###############################################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  subnet_ids         = module.vpc.private_subnets
  transit_gateway_id = data.terraform_remote_state.account_a.outputs.transit_gateway_id
  vpc_id             = module.vpc.vpc_id

  tags = {
    Name = local.name_prefix
  }
}

output "transit_gateway_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.main.id
}
