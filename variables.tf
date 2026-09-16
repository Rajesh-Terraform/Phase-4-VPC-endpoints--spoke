variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "spoke_vpc_cidr" {
  description = "Existing Spoke VPC CIDR"
  type        = string
  default     = "10.1.0.0/16"
}