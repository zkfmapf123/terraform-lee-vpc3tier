output "vpc" {
  value = {
    vpc_id     = aws_vpc.vpc.id
    nat_id     = aws_nat_gateway.nat.id
    nat_eip_id = aws_eip.nat_eip.id
    nat_eip_ip = aws_eip.nat_eip.public_ip

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
