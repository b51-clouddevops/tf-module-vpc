# Creates Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block                 = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id  = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name = "${var.ENV}-public-route-table"
  }
}

# Attach the route table to public subnets
resource "aws_route_table_association" "a" {
  count          = length(var.PUBLIC_SUBNET_CIDR) 
  subnet_id      = aws_subnet.foo.id
  route_table_id = aws_route_table.bar.id
}