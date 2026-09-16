output "interface_endpoint_ids" {
  description = "Created interface endpoint IDs"
  value       = module.vpc_endpoints.interface_endpoint_ids
}

output "s3_endpoint_id" {
  description = "Created S3 gateway endpoint ID"
  value       = module.vpc_endpoints.s3_endpoint_id
}

output "endpoint_security_group_id" {
  description = "Endpoint security group ID"
  value       = module.vpc_endpoints.endpoint_security_group_id
}   