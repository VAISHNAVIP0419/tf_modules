output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "key_name_used" {
  value = var.create_key ? aws_key_pair.this[0].key_name : var.existing_key_name
}
