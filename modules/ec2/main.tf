# Generate key only for first instance
resource "tls_private_key" "key" {
  count      = var.first_instance ? 1 : 0
  algorithm  = "RSA"
  rsa_bits   = 4096
}

resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  tags = merge(var.tags, { Name = var.name })
}

# Output private key only for first instance
output "private_key_pem" {
  value     = var.first_instance ? tls_private_key.key[0].private_key_pem : ""
  sensitive = true
}

# Instance info
output "instance" {
  value = {
    id         = aws_instance.this.id
    public_ip  = aws_instance.this.public_ip
    private_ip = aws_instance.this.private_ip
    key_name   = aws_instance.this.key_name
  }
}