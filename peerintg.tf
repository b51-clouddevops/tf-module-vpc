resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = aws_vpc.main.id            # VPC that we are creating
  vpc_id        =              # Default VPC ID, where our bastion, WS jenkins are residing.

  tags = {
    Name  = "${var.ENV}-default-robot-peering"
  }
}