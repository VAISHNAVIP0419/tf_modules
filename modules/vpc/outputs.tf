output "vpc_id" {
  value = aws_vpc.this.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = length(aws_route_table.private) > 0 ? aws_route_table.private[0].id : ""
}

output "nat_gateway_id" {
  value = length(aws_nat_gateway.nat) > 0 ? aws_nat_gateway.nat[0].id : ""
}

output "nat_eip_allocation_id" {
  value = length(aws_eip.nat) > 0 ? aws_eip.nat[0].id : ""
}