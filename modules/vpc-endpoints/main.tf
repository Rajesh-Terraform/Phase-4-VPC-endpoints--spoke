locals {
  interface_endpoints = [
    "ssm",
    "ssmmessages",
    "ec2messages",
    "logs",
    "secretsmanager",
    "kms",
    "sts",
    "ecr.api",
    "ecr.dkr"
  ]
}

resource "aws_security_group" "endpoint" {
  name        = "spoke-vpc-endpoints-sg"
  description = "Allow HTTPS from Spoke VPC"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS from Spoke VPC"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["10.1.0.0/16"]
  }

  egress {
    description = "Allow outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "spoke-vpc-endpoints-sg"
  }
}

resource "aws_vpc_endpoint" "interface" {
  for_each = toset(local.interface_endpoints)

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.ap-south-1.${each.value}"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    aws_security_group.endpoint.id
  ]

  tags = {
    Name = "spoke-${each.value}-endpoint"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.ap-south-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = var.private_route_table_ids

  tags = {
    Name = "spoke-s3-endpoint"
  }
}