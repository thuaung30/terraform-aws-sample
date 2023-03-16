variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "a_zone" {
  type    = string
  default = "ap-south-1b"
}

variable "ami_id" {
  type    = string
  default = "ami-0912cd2fb490de15d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "foo_pub_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/Q89jqJkQSLE4C2Fsa663vHvRAWrilDJ6L7eJVPngk thuhtetaung.d2@gmail.com"
}
