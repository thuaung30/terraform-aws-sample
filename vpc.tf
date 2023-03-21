resource "aws_vpc" "foo_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "foo_vpc"
  }
}

resource "aws_subnet" "foo_pub_sub" {
  vpc_id            = aws_vpc.foo_vpc.id
  cidr_block        = var.pub_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.foo_vpc]

  tags = {
    Name = "foo_pub_sub"
  }
}

resource "aws_subnet" "foo_pri_sub" {
  vpc_id            = aws_vpc.foo_vpc.id
  cidr_block        = var.pri_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.foo_vpc]

  tags = {
    Name = "foo_pri_sub"
  }
}
