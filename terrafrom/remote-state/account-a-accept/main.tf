data "terraform_remote_state" "account_b" {
  backend = "s3"

  config = {
    bucket = var.remote_state_account_b.bucket
    key    = var.remote_state_account_b.key
    region = var.remote_state_account_b.region
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "main" {
  transit_gateway_attachment_id = data.terraform_remote_state.account_b.outputs.transit_gateway_attachment_id
}
