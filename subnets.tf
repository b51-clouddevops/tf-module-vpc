# count.index is going to fetch the count iteration and element is going to fetch the value from the list as per the index

resource "aws_subnet" "public" {
  count      = length(var.PUBLIC_SUBNET_CIDR) 
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR, count.index)

  tags = {
    Name = "Main"
  }
}

# count and element are funcitons in terraform