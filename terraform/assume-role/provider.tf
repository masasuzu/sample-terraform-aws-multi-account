terraform {
  required_version = "~> 1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
  backend "s3" {
  }
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
  alias  = "account_a"
  region = "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.account_a.id}:role/${local.common_prefix}-terraform"
  }
  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
  alias  = "account_b"
  region = "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.account_b.id}:role/${local.common_prefix}-terraform"
  }
  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}
