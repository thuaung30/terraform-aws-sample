resource "aws_network_acl" "foo_pub_nacl" {
  vpc_id     = aws_vpc.foo_vpc.id
  subnet_ids = [aws_subnet.foo_pub_sub.id]

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  depends_on = [
    aws_vpc.foo_vpc,
    aws_subnet.foo_pub_sub,
  ]

  tags = {
    Name = "foo_pub_nacl"
  }
}

resource "aws_network_acl" "foo_pri_nacl" {
  vpc_id     = aws_vpc.foo_vpc.id
  subnet_ids = [aws_subnet.foo_pri_sub.id]

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.foo_vpc.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  depends_on = [
    aws_vpc.foo_vpc,
    aws_subnet.foo_pri_sub,
  ]

  tags = {
    Name = "foo_pri_nacl"
  }
}
