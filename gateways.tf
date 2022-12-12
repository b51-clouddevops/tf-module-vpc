# Creates Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "robot-${var.ENV}-igw"
  }
}


# Creates NAT Gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "robot-${var.ENV}-igw"
  }

# This ensure, this ngw will only be created if the igw is created
  depends_on = [aws_internet_gateway.example]
}