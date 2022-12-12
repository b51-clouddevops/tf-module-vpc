resource "aws_vpc_peering_connection" "peer" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.bar.id
  vpc_id        = aws_vpc.foo.id

  tags = {
    Name  = ${var.ENV}-default-robot-peering
  }
}