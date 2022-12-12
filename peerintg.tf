resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = aws_vpc.main.id            # VPC that we are creating
  vpc_id        = aws_vpc.foo.id

  tags = {
    Name  = "${var.ENV}-default-robot-peering"
  }
}