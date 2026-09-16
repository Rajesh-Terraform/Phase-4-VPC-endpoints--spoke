output "interface_endpoint_ids" {
  description = "Interface VPC endpoint IDs"
  value       = {
    for service, endpoint in aws_vpc_endpoint.interface :
    service => endpoint.id
  }
}

output "s3_endpoint_id" {
  description = "S3 Gateway endpoint ID"
  value       = aws_vpc_endpoint.s3.id
}

output "endpoint_security_group_id" {
  description = "Security group ID for interface endpoints"
  value       = aws_security_group.endpoint.id
} 