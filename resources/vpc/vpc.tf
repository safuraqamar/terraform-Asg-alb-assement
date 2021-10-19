resource "aws_vpc" "coal_fire" {
  #count = var.create_vpc ? 1 : 0

  cidr_block                       = var.cidr
  #instance_tenancy                 = var.instance_tenancy
  #enable_dns_hostnames             = var.enable_dns_hostnames
  #enable_dns_support               = var.enable_dns_support
  #enable_classiclink               = var.enable_classiclink
  #enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  #assign_generated_ipv6_cidr_block = var.enable_ipv6

  tags = var.tags
}
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.coal_fire.id

  tags = var.tags
}
resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.coal_fire.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "Public_Route_table"
  }
}
resource "aws_route_table_association" "public_1_rt" {
  subnet_id      = var.pub_subnet_1
  route_table_id = aws_route_table.public_routetable.id
}
resource "aws_route_table_association" "public_2_rt" {
  subnet_id      = var.pub_subnet_2
  route_table_id = aws_route_table.public_routetable.id
}

