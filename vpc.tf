resource "aws_vpc" "foo_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "foo_pub_sub" {
  vpc_id            = aws_vpc.foo_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1b"

  depends_on = [aws_vpc.foo_vpc]
}

resource "aws_subnet" "foo_pri_sub" {
  vpc_id            = aws_vpc.foo_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"

  depends_on = [aws_vpc.foo_vpc]
}
