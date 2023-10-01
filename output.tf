output "vpc" {
  value = {
    vpc_id     = aws_vpc.vpc.id
    nat_id     = aws_nat_gateway.nat.id
    nat_eip_id = aws_eip.nat_eip.id
    nat_eip_ip = aws_eip.nat_eip.public_ip

    public_subnets = {
      for az, subnet in aws_subnet.public :
      "${var.vpc_region}${az}" => subnet.id
    }

    private_subnets = {
      for az, subnet in aws_subnet.private :
      "${var.vpc_region}${az}" => subnet.id
    }
  }
}
