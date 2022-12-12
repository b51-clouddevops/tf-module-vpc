resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = aws_vpc.main.id            # VPC that we are creating
  vpc_id        = var.DEFAULT_VPC_ID         # Default VPC ID, where our bastion, WS jenkins are residing.
  auto_accept   = true
  tags = {
    Name  = "${var.ENV}-default-robot-peering"
  }
}