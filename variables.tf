variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "spoke_vpc_cidr" {
  description = "CIDR of the existing Spoke VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs of the existing Spoke VPC"
  type        = list(string)
}

variable "private_route_table_ids" {
  description = "Private route table IDs of the existing Spoke VPC"
  type        = list(string)
}