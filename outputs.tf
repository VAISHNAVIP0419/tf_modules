output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "sg_id" {
  value = module.sg.sg_id
}

output "ec2_1_info" {
  value = module.ec2_1.instance
}

output "ec2_2_info" {
  value = module.ec2_2.instance
}

output "ec2_3_info" {
  value = module.ec2_3.instance
}

output "ec2_4_info" {
  value = module.ec2_4.instance
}

output "ebs_snapshot_info" {
  value = {
    volume_id   = module.ebs_snapshot.volume_id
    snapshot_id = module.ebs_snapshot.snapshot_id
  }
}

output "ec2_private_key_pem" {
  value     = module.ec2_1.private_key_pem
  sensitive = true
}