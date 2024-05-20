locals {
  account_a = {
    name_prefix = "acount-a"
  }
  account_b = {
    name_prefix = "acount-b"
  }
}

###############################################################################
# VPC
###############################################################################
module "vpc_account_a" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  providers = {
    aws = aws.account_a
  }

  name = local.account_a.name_prefix
  cidr = var.account_a.vpc.cidr

  azs             = var.account_a.azs
  private_subnets = var.account_a.vpc.private_subnets

  enable_nat_gateway = false
}

module "vpc_account_b" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  providers = {
    aws = aws.account_b
  }

  name = local.account_b.name_prefix
  cidr = var.account_b.vpc.cidr

  azs             = var.account_b.azs
  private_subnets = var.account_b.vpc.private_subnets

  enable_nat_gateway = false
}

###############################################################################
# Transit Gateway
###############################################################################
resource "aws_ec2_transit_gateway" "main" {
  provider = aws.account_a

  description = "Transit Gateway"
  tags = {
    Name = var.common_prefix
  }
}

###############################################################################
# Resource Share
###############################################################################
resource "aws_ram_resource_share" "main" {
  provider = aws.account_a

  name                      = "${var.common_prefix}-tgw"
  allow_external_principals = false
}

resource "aws_ram_resource_association" "main" {
  provider = aws.account_a

  resource_arn       = aws_ec2_transit_gateway.main.arn
  resource_share_arn = aws_ram_resource_share.main.arn
}

resource "aws_ram_principal_association" "main" {
  provider = aws.account_a

  principal          = var.account_b.id
  resource_share_arn = aws_ram_resource_share.main.arn
}


###############################################################################
# Transit Gateway Attachment
###############################################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "account_a" {
  provider = aws.account_a

  subnet_ids         = module.vpc_account_a.private_subnets
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = module.vpc_account_a.vpc_id

  tags = {
    Name = local.account_a.name_prefix
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "account_b" {
  provider = aws.account_b

  subnet_ids         = module.vpc_account_b.private_subnets
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = module.vpc_account_b.vpc_id

  tags = {
    Name = local.account_b.name_prefix
  }

  depends_on = [
    aws_ram_resource_share.main,
    aws_ram_principal_association.main,
    aws_ram_resource_association.main,
  ]
}

###############################################################################
# Transit Gateway Attachment Accepter
###############################################################################
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "account_b" {
  provider = aws.account_a

  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.account_b.id
}
