resource "aws_ebs_volume" "test" {
  availability_zone = var.availability_zone
  size              = var.size_gb
  tags              = merge(var.tags, { Name = "tf-ebs-test" })
}

resource "aws_ebs_snapshot" "snap" {
  volume_id   = aws_ebs_volume.test.id
  description = "test snapshot by terraform - small 1GB"
  tags        = merge(var.tags, { Name = "tf-ebs-snap" })
}