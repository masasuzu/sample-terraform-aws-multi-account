# assume roleを使用して複数アカウントをまとめて扱うパターン

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.account_a"></a> [aws.account\_a](#provider\_aws.account\_a) | 5.48.0 |
| <a name="provider_aws.account_b"></a> [aws.account\_b](#provider\_aws.account\_b) | 5.48.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc_account_a"></a> [vpc\_account\_a](#module\_vpc\_account\_a) | terraform-aws-modules/vpc/aws | 5.8.1 |
| <a name="module_vpc_account_b"></a> [vpc\_account\_b](#module\_vpc\_account\_b) | terraform-aws-modules/vpc/aws | 5.8.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.account_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.account_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ec2_transit_gateway_vpc_attachment_accepter.account_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment_accepter) | resource |
| [aws_ram_principal_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_a"></a> [account\_a](#input\_account\_a) | アカウントAの設定 | <pre>object({<br>    id   = string<br>    name = string<br>    vpc = object({<br>      cidr            = string<br>      private_subnets = list(string)<br>    })<br>    azs = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_account_b"></a> [account\_b](#input\_account\_b) | アカウントBの設定 | <pre>object({<br>    id   = string<br>    name = string<br>    vpc = object({<br>      cidr            = string<br>      private_subnets = list(string)<br>    })<br>    azs = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_common_prefix"></a> [common\_prefix](#input\_common\_prefix) | 共通のプレフィックス | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
