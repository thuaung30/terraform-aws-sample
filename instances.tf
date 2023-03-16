data "aws_ami" "foo" {
  ami           = "ami-0912cd2fb490de15d"
  instance_type = "t2.micro"
}

data "aws_keypair" "my_key" {
  pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/Q89jqJkQSLE4C2Fsa663vHvRAWrilDJ6L7eJVPngk thuhtetaung.d2@gmail.com"
}

resource "aws_keypair" "my_key" {
  key_name   = "my_key"
  public_key = data.aws_keypair.my_key
}

resource "aws_instance" "foo_pub_ec2" {
  ami           = data.aws_ami.foo.ami
  instance_type = data.aws_ami.foo.instance_type
  key_name      = aws_keypair.my_key.key_name
  subnet_id     = aws_subnet.foo_pub_sub.id

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.foo_pub_sg.id]

  depends_on = [
    aws_keypair.mykey,
    aws_subnet.foo_pub_sub,
    aws_security_group.foo_pub_sg
  ]
}

resource "aws_instance" "foo_pri_ec2" {
  ami           = data.aws_ami.foo.ami
  instance_type = data.aws_ami.foo.instance_type
  key_name      = aws_keypair.my_key.key_name
  subnet_id     = aws_subnet.foo_pri_sub.id

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.foo_pri_sg.id]

  depends_on = [
    aws_keypair.mykey,
    aws_subnet.foo_pri_sub,
    aws_security_group.foo_pri_sg
  ]
}
