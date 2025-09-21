# optional key pair (create only when create_key = true)
resource "aws_key_pair" "this" {
  count      = var.create_key ? 1 : 0
  key_name   = var.key_name != "" ? var.key_name : "${var.name}-key"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id != "" ? var.subnet_id : null
  vpc_security_group_ids = length(var.security_group_ids) > 0 ? var.security_group_ids : null

  # set key_name only when create_key = true OR existing_key_name provided
  key_name = var.create_key ? aws_key_pair.this[0].key_name : (var.existing_key_name != "" ? var.existing_key_name : null)

  # small root disk (default), keep it simple and safe
  root_block_device {
    volume_size = var.root_volume_size
    delete_on_termination = true
  }

  tags = merge({ Name = var.name }, var.tags)
}