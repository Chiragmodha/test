resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true

    tags = {
      name = "testVPC"
    }
}

resource "aws_subnet" "publictest_sb" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "10.0.1.0/16"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    name = "publictest_sb"
  }

}




resource "aws_subnet" "privatetest_sb" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "10.0.2.0/16"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    name = "privatetest_sb"
  }

}





resource "aws_security_group" "publictest_sg" {
  vpc_id = aws_vpc.testvpc.id
  name = "public sg"
  description = "Public Security Group"

  tags = {
    name = "publictest_sg"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = "[0.0.0.0/0]"
  }

    ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = "[0.0.0.0/0]"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "[0.0.0.0/0]"
  }
}

