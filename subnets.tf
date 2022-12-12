resource "aws_subnet" "public" {
  count      = length(var.PUBLIC_SUBNET_CIDR) 
  vpc_id     = aws_vpc.main.id
  cidr_block = ?

  tags = {
    Name = "Main"
  }
}

