# Creates Public Route Table
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
resource "aws_route_table_association" "pub-rt-association" {
  count          = length(aws_subnet.public.*.id) 
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

# Creates Private Route Table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block                 = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id  = aws_vpc_peering_connection.peer.id
  }

  route {
    cidr_block                 = "0.0.0.0/0"
    nat_gateway_id             = aws_nat_gateway.ngw.id
  }  

  tags = {
    Name = "${var.ENV}-private-route-table"
  }
}

# Attach the route table to public subnets
resource "aws_route_table_association" " "prv-rt-association"" {
  count          = length(aws_subnet.public.*.id) 
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}