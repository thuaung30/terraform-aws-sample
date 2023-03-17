resource "aws_network_acl" "foo_pub_nacl" {
  vpc_id     = aws_vpc.foo_vpc.id
  subnet_ids = [aws_subnet.foo_pub_sub.id]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 23
    to_port    = 23
  }


  ingress {
    protocol   = "icmp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 40
    icmp_type  = -1
    icmp_code  = -1
  }

  /* ingress { */
  /*   protocol   = "all" */
  /*   rule_no    = 100 */
  /*   action     = "allow" */
  /*   cidr_block = "0.0.0.0/0" */
  /*   from_port  = 0 */
  /*   to_port    = 0 */
  /* } */

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
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.foo_vpc.cidr_block
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = aws_vpc.foo_vpc.cidr_block
    from_port  = 23
    to_port    = 23
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = aws_vpc.foo_vpc.cidr_block
    from_port  = 5432
    to_port    = 5432
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = aws_vpc.foo_vpc.cidr_block
    from_port  = 6379
    to_port    = 6379
  }

  ingress {
    protocol   = "icmp"
    rule_no    = 500
    action     = "allow"
    cidr_block = aws_vpc.foo_vpc.cidr_block
    from_port  = 0
    to_port    = 40
    icmp_type  = -1
    icmp_code  = -1
  }

  /* ingress { */
  /*   protocol   = "all" */
  /*   rule_no    = 100 */
  /*   action     = "allow" */
  /*   cidr_block = aws_vpc.foo_vpc.cidr_block */
  /*   from_port  = 0 */
  /*   to_port    = 0 */
  /* } */

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
    Name = "foo_pri_nacl"
  }
}
