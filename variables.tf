variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "Existing spoke VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Existing spoke private subnet IDs"
  type        = list(string)
}

variable "private_route_table_ids" {
  description = "Existing spoke private route table IDs"
  type        = list(string)
}