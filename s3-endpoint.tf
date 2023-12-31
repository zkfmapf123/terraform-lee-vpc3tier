resource "aws_vpc_endpoint" "s3-gw-gateway" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.vpc_region}.s3"

  policy = jsonencode({
    Statement = [
      {
        Action    = "*",
        Effect    = "Allow",
        Principal = "*",
        Resource  = "*"
      }
    ],
    Version = "2008-10-17"
  })

  route_table_ids = [
    for _, rt in [aws_route_table.private_route_table, aws_route_table.db_route_table] :
    rt.id
  ]

  tags = {
    Name     = "s3"
    Property = "Gateway"
  }
}
