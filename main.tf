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