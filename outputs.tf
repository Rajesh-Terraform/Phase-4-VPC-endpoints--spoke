output "spoke_vpc_id" {
  description = "Detected Spoke VPC ID"
  value       = data.aws_vpc.spoke.id
}

output "private_subnet_ids" {
  description = "Detected private subnet IDs"
  value       = data.aws_subnets.private.ids
}

output "private_route_table_ids" {
  description = "Detected private route table IDs"
  value       = data.aws_route_tables.private.ids
}

output "interface_endpoint_ids" {
  description = "Interface endpoint IDs"
  value       = module.vpc_endpoints.interface_endpoint_ids
}

output "s3_endpoint_id" {
  description = "S3 Gateway endpoint ID"
  value       = module.vpc_endpoints.s3_endpoint_id
}