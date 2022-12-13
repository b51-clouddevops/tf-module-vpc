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
    value = aws_subnet.private.*.cidr_block
}

output "PUBLIC_SUBNET_CIDR" {
    value = aws_subnet.public.*.cidr_block
}

output "DEFAULT_VPC_ID" {
    value  =  var.DEFAULT_VPC_ID
}

output "DEFAULT_VPC_CIDR" {
    value  =  var.DEFAULT_VPC_CIDR
}