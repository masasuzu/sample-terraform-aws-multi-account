resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "main" {
  transit_gateway_attachment_id = var.transit_gateway_attachment_id
}
