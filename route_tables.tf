resource "aws_route_table" "foo_pub_rt" {
  vpc_id = aws_vpc.foo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.foo_igw.id
  }

  depends_on = [aws_vpc.foo_vpc, aws_internet_gateway.foo_igw]

  tags = {
    Name = "foo_pub_rt"
  }
}

resource "aws_route_table" "foo_pri_rt" {
  vpc_id = aws_vpc.foo_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.foo_ngw.id
  }

  depends_on = [aws_vpc.foo_vpc, aws_nat_gateway.foo_ngw]

  tags = {
    Name = "foo_pri_rt"
  }
}

resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.foo_pub_sub.id
  route_table_id = aws_route_table.foo_pub_rt.id
}

resource "aws_route_table_association" "pri" {
  subnet_id      = aws_subnet.foo_pri_sub.id
  route_table_id = aws_route_table.foo_pri_rt.id
}
