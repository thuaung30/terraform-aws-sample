resource "aws_vpc" "foo_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "foo_pub_sub" {
    vpc_id = aws_vpc.foo_vpc.id
    cidr_block = "10.0.0.0/24" 
    availability_zone = "ap-south-1b"
    
    depends_on = [aws_vpc.foo_vpc]
}

resource "aws_subnet" "foo_pri_sub" {
    vpc_id = aws_vpc.foo_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1b"

    depends_on = [aws_vpc.foo_vpc]
}

resource "aws_network_acl" "foo_nacl" {
    vpc_id = aws_vpc.foo_vpc.id
    subnet_ids = [aws_subnet.foo_pub_sub, aws_subnet.foo_pri_sub]

    ingress {
        protocol   = "ssh"
        rule_no    = 100
        action     = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 22
        to_port    = 22
    }

    ingress {
        protocol   = "tcp"
        rule_no    = 200
        action     = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 443
        to_port    = 443
    }

    ingress {
        protocol   = "tcp"
        rule_no    = 300
        action     = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 80
        to_port    = 80
    }

    egress {
        protocol = "all"
        rule_no = 100
        action = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 0
        to_port    = 0
    }

    depends_on = [
        aws_vpc.foo_vpc, 
        aws_subnet.foo_pub_sub, 
        aws_subnet.foo_pri_sub
    ]
}

resource "aws_route_table" "foo_pub_rt" {
    vpc_id = aws_vpc.foo_vpc.id

    route {
        cidr_block = "10.0.0.0/16"
        gateway_id = aws_internet_gateway.foo_igw.id
    }

    depends_on = [aws_vpc.foo_vpc, aws_internet_gateway.foo_igw]
}

resource "aws_route_table" "foo_pri_rt" {
    vpc_id = aws_vpc.foo_vpc.id

    route {
        cidr_block = "10.0.0.0/16"
        gateway_id = aws_nat_gateway.foo_ngw.id
    }

    depends_on = [aws_vpc.foo_vpc, aws_nat_gateway.foo_ngw]
}
