module "vpc_endpoints" {
  source = "./modules/vpc-endpoints"

  vpc_id                 = var.vpc_id
  private_subnet_ids     = var.private_subnet_ids
  private_route_table_ids = var.private_route_table_ids
}