output "vpc" {
  value = {
    vpc_id     = aws_vpc.vpc.id
    nat_id     = var.is_enable_nat ? aws_nat_gateway.nat[0].id : null
    nat_eip_id = var.is_enable_nat ? aws_eip.nat_eip[0].id : null
    nat_eip_ip = var.is_enable_nat ? aws_eip.nat_eip[0].public_ip : null

    regions = [
      for az, _ in aws_subnet.webserver_subnets :
      "${var.vpc_region}${az}"
    ]

    webserver_subnets = {
      for az, subnet in aws_subnet.webserver_subnets :
      "${var.vpc_region}${az}" => subnet.id
    }

    was_subnets = {
      for az, subnet in aws_subnet.was_subnets :
      "${var.vpc_region}${az}" => subnet.id
    }

    db_subnets = {
      for az, subnet in aws_subnet.db_subnets :
      "${var.vpc_region}${az}" => subnet.id
    }
  }
}

output "s3_endpoint" {
  value = aws_vpc_endpoint.vpce_s3
}
