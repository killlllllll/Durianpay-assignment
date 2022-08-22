resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.durian-vpc.id
  cidr_block = "${var.public_subnet}"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
  Name = var.public_subnet_name
  })
}


resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.durian-vpc.id
  cidr_block = "${var.private_subnet}"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
  Name = var.private_subnet_name
  })
}

