output "vpc_id" {
  value = try(module.vpc[0].vpc_id, null)
}

output "public_subnet_ids" {
  value = try(module.vpc[0].public_subnet_ids, [])
}

output "security_group_id" {
  value = try(module.sg[0].security_group_id, null)
}

output "ec2_instance_ids" {
  value = [
    try(module.ec2_server_1[0].instance_id, null),
    try(module.ec2_server_2[0].instance_id, null),
    try(module.ec2_server_3[0].instance_id, null),
    try(module.ec2_server_4[0].instance_id, null),
  ]
}

output "ebs_snapshot_id" {
  value = try(module.ebs_snapshot[0].snapshot_id, null)
}