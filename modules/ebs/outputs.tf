output "volume_id" {
  value = try(aws_ebs_volume.test_vol[0].id, null)
}

output "snapshot_id" {
  value = try(aws_ebs_snapshot.test_snap[0].id, null)
}