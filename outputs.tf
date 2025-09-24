output "vpc_id" {
  value = var.enable_vpc ? module.vpc[0].vpc_id : null
}

output "public_subnets" {
  value = var.enable_vpc ? module.vpc[0].public_subnet_ids : []
}

output "private_subnets" {
  value = var.enable_vpc ? module.vpc[0].private_subnet_ids : []
}

output "internet_gateway_id" {
  value = var.enable_vpc ? module.vpc[0].igw_id : null
}

output "public_route_table_id" {
  value = var.enable_vpc ? module.vpc[0].public_route_table_id : null
}

output "private_route_table_id" {
  value = var.enable_vpc ? module.vpc[0].private_route_table_id : null
}

output "nat_gateway_id" {
  value = var.enable_vpc ? module.vpc[0].nat_gateway_id : null
}

output "nat_eip_allocation_id" {
  value = var.enable_vpc ? module.vpc[0].nat_eip_allocation_id : null
}

output "sg_id" {
  value = var.enable_sg ? module.sg[0].sg_id : null
}

output "ec2_1_info" {
  value = var.enable_ec2_1 ? module.ec2_1[0].instance : null
}

output "ec2_2_info" {
  value = var.enable_ec2_2 ? module.ec2_2[0].instance : null
}

output "ec2_3_info" {
  value = var.enable_ec2_3 ? module.ec2_3[0].instance : null
}

output "ec2_4_info" {
  value = var.enable_ec2_4 ? module.ec2_4[0].instance : null
}

output "ec2_private_key_pem" {
  value     = var.enable_ec2_1 && var.create_key_for_ec2 ? module.ec2_1[0].private_key_pem : null
  sensitive = true
}

output "ebs_snapshot_info" {
  value = var.enable_ebs ? {
    volume_id   = module.ebs_snapshot[0].volume_id
    snapshot_id = module.ebs_snapshot[0].snapshot_id
  } : {}
}