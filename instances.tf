resource "aws_keypair" "foo_key" {
  key_name   = "foo_key"
  public_key = var.foo_pub_key
}

resource "aws_instance" "foo_pub_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_keypair.foo_key.key_name
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
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_keypair.foo_key.key_name
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
