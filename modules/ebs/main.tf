# create a 1 GiB volume and snapshot it when create = true
resource "aws_ebs_volume" "test_vol" {
  count             = var.create ? 1 : 0
  availability_zone = var.az
  size              = var.size
  tags              = merge({ Name = "${var.name}-vol" }, var.tags)
}

resource "aws_ebs_snapshot" "test_snap" {
  count     = var.create ? 1 : 0
  volume_id = aws_ebs_volume.test_vol[0].id
  tags      = merge({ Name = "${var.name}-snap" }, var.tags)
}
