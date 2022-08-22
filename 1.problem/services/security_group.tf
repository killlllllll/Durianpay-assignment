resource "aws_security_group" "durianpay_asg_sg" {
  name        = var.securitygroup_name
  description = "Allow SSH into EC2"
  vpc_id      = aws_vpc.durian-vpc.id

  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
  }

  egress {
    from_port        = var.egress_port
    to_port          = var.egress_port
    protocol         = var.egress_protocol
    cidr_blocks      = var.cidr_blocks
  }

  tags = merge(local.common_tags, {
  Name = var.securitygroup_name
  })
}