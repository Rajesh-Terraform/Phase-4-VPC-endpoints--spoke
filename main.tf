data "aws_vpc" "spoke" {
  filter {
    name   = "cidr"
    values = [var.spoke_vpc_cidr]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.spoke.id]
  }

  tags = {
    Tier = "private"
  }
}

data "aws_route_tables" "private" {
  vpc_id = data.aws_vpc.spoke.id

  filter {
    name   = "tag:Tier"
    values = ["private"]
  }
}

module "vpc_endpoints" {
  source = "./modules/vpc-endpoints"

  vpc_id                  = data.aws_vpc.spoke.id
  private_subnet_ids      = data.aws_subnets.private.ids
  private_route_table_ids = data.aws_route_tables.private.ids
}