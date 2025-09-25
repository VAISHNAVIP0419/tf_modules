output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "key_name" {
  value = aws_instance.this.key_name
}
# Output private key
output "private_key_pem" {
  value     = var.first_instance ? tls_private_key.key[0].private_key_pem : ""
  sensitive = true
}