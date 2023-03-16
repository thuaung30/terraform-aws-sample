output "vpc_id" {
  value = aws_vpc.foo_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.foo_pub_sub.id
}

output "private_subnet_id" {
  value = aws_subnet.foo_pri_sub.id
}

output "public_ec2_address" {
  value = aws_instance.foo_pub_ec2.public_ip
}
