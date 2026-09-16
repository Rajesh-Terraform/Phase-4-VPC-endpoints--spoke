output "interface_endpoint_ids" {
  description = "Interface VPC endpoint IDs"

  value = {
    for service, endpoint in aws_vpc_endpoint.interface :
    service => endpoint.id
  }
}

output "s3_endpoint_id" {
  description = "S3 Gateway endpoint ID"
  value       = aws_vpc_endpoint.s3.id
}

output "endpoint_security_group_id" {
  description = "Endpoint security group ID"
  value       = aws_security_group.endpoint.id
}  