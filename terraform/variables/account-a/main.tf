locals {
  name_prefix = "acount-a"
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
resource "aws_ec2_transit_gateway" "main" {
  description = "Transit Gateway"
  tags = {
    Name = local.name_prefix
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  subnet_ids         = module.vpc.private_subnets
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = module.vpc.vpc_id

  tags = {
    Name = local.name_prefix
  }
}

###############################################################################
# Resource Share
###############################################################################
resource "aws_ram_resource_share" "main" {
  name                      = "${local.name_prefix}-tgw"
  allow_external_principals = false
}

resource "aws_ram_resource_association" "main" {
  resource_arn       = aws_ec2_transit_gateway.main.arn
  resource_share_arn = aws_ram_resource_share.main.arn
}

resource "aws_ram_principal_association" "main" {
  principal          = var.account_b_id
  resource_share_arn = aws_ram_resource_share.main.arn
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.main.id
}
