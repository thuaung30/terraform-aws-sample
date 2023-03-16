resource "aws_eip" "foo_ngw_eip" {
  vpc = true
}

resource "aws_internet_gateway" "foo_igw" {
  vpc_id = aws_vpc.foo_vpc.id

  depends_on = [aws_vpc.foo_vpc]

  tags = {
    Name = "foo_igw"
  }
}

resource "aws_nat_gateway" "foo_ngw" {
  allocation_id = aws_eip.foo_ngw_eip.id
  subnet_id     = aws_subnet.foo_pub_sub.id

  depends_on = [
    aws_subnet.foo_pub_sub,
    aws_internet_gateway.foo_igw
  ]

  tags = {
    Name = "foo_ngw"
  }
}

