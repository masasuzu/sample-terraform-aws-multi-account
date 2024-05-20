# account-b

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.48.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.8.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_vpc_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [terraform_remote_state.account_a](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | アカウント名 | `string` | `"account-b"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | 使用するAZ | `list(string)` | <pre>[<br>  "ap-northeast-1a",<br>  "ap-northeast-1c",<br>  "ap-northeast-1d"<br>]</pre> | no |
| <a name="input_remote_state_account_a"></a> [remote\_state\_account\_a](#input\_remote\_state\_account\_a) | n/a | <pre>object({<br>    bucket = string<br>    key    = string<br>    region = string<br>  })</pre> | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | vpc情報 | <pre>object({<br>    cidr            = string<br>    private_subnets = list(string)<br>  })</pre> | <pre>{<br>  "cidr": "10.2.0.0/16",<br>  "private_subnets": [<br>    "10.2.1.0/24",<br>    "10.2.2.0/24",<br>    "10.2.3.0/24"<br>  ]<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_transit_gateway_attachment_id"></a> [transit\_gateway\_attachment\_id](#output\_transit\_gateway\_attachment\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
