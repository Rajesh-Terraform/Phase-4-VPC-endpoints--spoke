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
  description = "Private subnet IDs in the spoke VPC"
  type        = list(string)
}  