resource "aws_vpc" "durian-vpc" {
  cidr_block       = "${var.vpc-cidr}"
  enable_dns_hostnames = true
  instance_tenancy = var.instance_tenancy

  tags = merge(local.common_tags, {
  Name = var.vpc_name
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.durian-vpc.id

  tags = merge(local.common_tags, {
  Name = var.igw_name
  })
}


resource "aws_eip" "eip" {
  vpc      = true

  tags = merge(local.common_tags, {
  Name = ""
  })
}


resource "aws_nat_gateway" "NatGateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id

  tags = merge(local.common_tags, {
  Name =  var.nat_name
  })
}
