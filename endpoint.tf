############################################ Security Groups
resource "aws_security_group" "private_sg" {
  vpc_id      = aws_vpc.vpc.id
  description = "endpoint sg"
  name        = "endpoint-private-sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-private-sg",
  }
}

############################################ s3 endpoint 
resource "aws_vpc_endpoint" "vpce_s3" {
  count = lookup(var.endpoint_setting, "s3_is_enable") ? 1 : 0

  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.vpc_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private_route_table.id]

  tags = {
    Name = "${var.prefix}-endpoint-s3",
  }
}

############################################ ecr endpoint 
resource "aws_vpc_endpoint" "ecr_endpoint_api" {
  count = lookup(var.endpoint_setting, "ecr_is_enable") ? 1 : 0

  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.${var.vpc_region}.ecr.api"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.private_sg.id]
  subnet_ids = [
    for id, value in aws_subnet.was_subnets :
    value.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-ecr-api",
  }

}

resource "aws_vpc_endpoint" "ecr_endpoint_dkr" {
  count              = lookup(var.endpoint_setting, "ecr_is_enable") ? 1 : 0
  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.${var.vpc_region}.ecr.dkr"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.private_sg.id]
  subnet_ids = [
    for id, value in aws_subnet.was_subnets :
    value.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-ecr-dkr",
  }
}

resource "aws_vpc_endpoint" "ecr_endpoint_logs" {
  count              = lookup(var.endpoint_setting, "ecr_is_enable") ? 1 : 0
  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.${var.vpc_region}.logs"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.private_sg.id]
  subnet_ids = [
    for id, value in aws_subnet.was_subnets :
    value.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-ecr-logs",
  }
}

############################################ sqs endpoint 
resource "aws_vpc_endpoint" "endpoint_sqs" {
  count = lookup(var.endpoint_setting, "sqs_is_enable") ? 1 : 0

  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.${var.vpc_region}.sqs"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.private_sg.id]
  subnet_ids = [
    for id, value in aws_subnet.was_subnets :
    value.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-sqs",
  }
}

############################################ codepipeline endpoint 
resource "aws_vpc_endpoint" "endpoint_codepipeline" {
  count = lookup(var.endpoint_setting, "codepipeline_is_enable") ? 1 : 0

  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.${var.vpc_region}.codepipeline"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.private_sg.id]
  subnet_ids = [
    for id, value in aws_subnet.was_subnets :
    value.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-codepipeline",
  }
}

############################################# api gateway endpoint
resource "aws_vpc_endpoint" "api_gateway_endpoint" {
  count = lookup(var.endpoint_setting, "apigateway_is_enable") ? 1 : 0

  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.${var.vpc_region}.execute-api"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.private_sg.id]
  subnet_ids = [
    for id, value in aws_subnet.was_subnets :
    value.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-apigateway",
  }
}
