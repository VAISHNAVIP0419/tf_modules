output "volume_id" {
  value = aws_ebs_volume.test.id
}

output "snapshot_id" {
  value = aws_ebs_snapshot.snap.id
}