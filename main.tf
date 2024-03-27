################################################################
## VPC
################################################################
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = var.vpc_name
    Resource = "vpc"
  }
}

################################################################
## Igw
################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name     = "${var.vpc_name}-igw"
    Resource = "igw"
  }
}

################################################################
## webserver subnet
################################################################
resource "aws_subnet" "webserver_subnets" {
  for_each          = var.webserver_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value
  availability_zone = "${var.vpc_region}${each.key}"

  tags = {
    Name     = "${var.vpc_name}-${var.vpc_region}${each.key}-webserver"
    Resource = "subnet"
    Property = "webserver"
  }
}

################################################################
## was subnet
################################################################
resource "aws_subnet" "was_subnets" {
  for_each          = var.was_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value
  availability_zone = "${var.vpc_region}${each.key}"

  tags = {
    Name     = "${var.vpc_name}-${var.vpc_region}${each.key}-was"
    Resource = "subnet"
    Property = "was"
  }
}

################################################################
## db subnet
################################################################
resource "aws_subnet" "db_subnets" {
  for_each          = var.db_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value
  availability_zone = "${var.vpc_region}${each.key}"

  tags = {
    Name     = "${var.vpc_name}-${var.vpc_region}${each.key}-db"
    Resource = "subnet"
    Property = "db"
  }
}

################################################################
## webserver subnet Routing
################################################################
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name     = "public-rt"
    Resource = "route-table"
  }
}

resource "aws_route_table_association" "public-rt-mapping" {
  for_each = aws_subnet.webserver_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

################################################################
## was subnet Routing
################################################################
resource "aws_eip" "nat_eip" {

  tags = {
    Name     = "nat-eip"
    Resource = "nat-gateway"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = lookup(aws_subnet.webserver_subnets, "a").id

  tags = {
    Name     = "a-nat"
    Resource = "nat"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name     = "private-rt"
    Resource = "route-table"
  }
}

resource "aws_route_table_association" "private-rt-mapping" {
  for_each = aws_subnet.was_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}

################################################################
## db subnet Routing
################################################################
resource "aws_route_table" "db_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name     = "db-rt"
    Resource = "route-table"
  }
}

resource "aws_route_table_association" "db-rt-mapping" {
  for_each = aws_subnet.db_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.db_route_table.id
}
