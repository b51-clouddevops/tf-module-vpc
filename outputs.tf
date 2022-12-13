output "VPC_ID" {
    value = aws_vpc.main.id 
}

output "VPC_CIDR" {
    value =  aws_vpc.main.cidr_block
}

output "PRIVATE_SUBNET_ID" {
    value = aws_subnet.private.*.id
}

output "PUBLIC_SUBNET_ID" {
    value = aws_subnet.public.*.id
}

output "PRIVATE_SUBNET_CIDR" {
    value = aws_subnet.private.*.id
}