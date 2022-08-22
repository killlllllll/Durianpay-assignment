resource "aws_route_table" "durian-public-route-table" {
  vpc_id = aws_vpc.durian-vpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.common_tags, {
  Name = var.public_route
    })
} 

resource "aws_route_table" "durian-private-route-table" {
  vpc_id = aws_vpc.durian-vpc.id

  route {
     cidr_block = var.route_cidr
     gateway_id = aws_nat_gateway.NatGateway.id
  }

  tags = merge(local.common_tags, {
  Name = var.private_route
  })
}


resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.durian-public-route-table.id
}


resource "aws_route_table_association" "private_subnet_1a" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.durian-private-route-table.id
}