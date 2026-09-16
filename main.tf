data "aws_vpc" "spoke" {
  filter {
    name   = "cidr"
    values = [var.spoke_vpc_cidr]
  }
}

module "vpc_endpoints" {
  source = "./modules/vpc-endpoints"

  vpc_id                  = data.aws_vpc.spoke.id
  private_subnet_ids      = var.private_subnet_ids
  private_route_table_ids = var.private_route_table_ids
}