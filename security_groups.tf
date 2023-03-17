resource "aws_security_group" "foo_pub_sg" {
  name        = "foo_pub_sg"
  description = "allow http, https and ssh"
  vpc_id      = aws_vpc.foo_vpc.id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_vpc.foo_vpc]

  tags = {
    Name = "foo_pub_sg"
  }
}

resource "aws_security_group" "foo_pri_sg" {
  name        = "foo_pri_sg"
  description = "allow postgres, redis"
  vpc_id      = aws_vpc.foo_vpc.id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.foo_vpc.cidr_block]
  }

  ingress {
    description = "allow telnet"
    from_port   = 23
    to_port     = 23
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.foo_vpc.cidr_block]
  }

  ingress {
    description = "allow postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.foo_vpc.cidr_block]
  }

  ingress {
    description = "allow redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.foo_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_vpc.foo_vpc]

  tags = {
    Name = "foo_pri_sg"
  }
}
