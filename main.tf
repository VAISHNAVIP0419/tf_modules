# =========================
# VPC module
# =========================
module "vpc" {
  source = "./modules/vpc"
  count  = var.enable_vpc ? 1 : 0

  name_prefix     = "${var.name_prefix}-vpc"
  cidr            = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags            = var.common_tags
}

# =========================
# Security Group module
# =========================
module "sg" {
  source = "./modules/sg"
  count  = var.enable_sg ? 1 : 0

  name       = "${var.name_prefix}-sg"
  vpc_id     = var.enable_vpc ? module.vpc[0].vpc_id : null
  ssh_cidr   = var.ssh_cidr
  allow_http = true
  tags       = var.common_tags
}

# =========================
# S3 module
# =========================
module "s3" {
  source = "./modules/s3"
  count  = var.enable_s3 ? 1 : 0

  bucket_prefix = var.s3_bucket_prefix
  versioning    = false
  tags          = var.common_tags
}

# =========================
# Generate SSH key once
# =========================
resource "tls_private_key" "tf_key" {
  count     = var.create_key_for_ec2 ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf_key" {
  count      = var.create_key_for_ec2 ? 1 : 0
  key_name   = var.ec2_key_name
  public_key = tls_private_key.tf_key[0].public_key_openssh
}

# =========================
# EC2 Instances
# =========================
module "ec2_1" {
  source         = "./modules/ec2"
  count          = var.enable_ec2_1 ? 1 : 0
  first_instance = true

  ami                = var.ec2_ami
  instance_type      = var.ec2_instance_type
  subnet_id          = var.enable_vpc ? module.vpc[0].public_subnet_ids[0] : null
  security_group_ids = var.enable_sg ? [module.sg[0].sg_id] : []
  key_name           = var.create_key_for_ec2 ? aws_key_pair.tf_key[0].key_name : var.existing_key_name
  tags               = var.common_tags
  name               = "${var.name_prefix}-ec2-1"
}

module "ec2_2" {
  source         = "./modules/ec2"
  count          = var.enable_ec2_2 ? 1 : 0
  first_instance = false

  ami                = var.ec2_ami
  instance_type      = var.ec2_instance_type
  subnet_id          = var.enable_vpc ? module.vpc[0].public_subnet_ids[1] : null
  security_group_ids = var.enable_sg ? [module.sg[0].sg_id] : []
  key_name           = var.create_key_for_ec2 ? aws_key_pair.tf_key[0].key_name : var.existing_key_name
  tags               = var.common_tags
  name               = "${var.name_prefix}-ec2-2"
}

module "ec2_3" {
  source         = "./modules/ec2"
  count          = var.enable_ec2_3 ? 1 : 0
  first_instance = false

  ami                = var.ec2_ami
  instance_type      = var.ec2_instance_type
  subnet_id          = var.enable_vpc ? module.vpc[0].public_subnet_ids[0] : null
  security_group_ids = var.enable_sg ? [module.sg[0].sg_id] : []
  key_name           = var.create_key_for_ec2 ? aws_key_pair.tf_key[0].key_name : var.existing_key_name
  tags               = var.common_tags
  name               = "${var.name_prefix}-ec2-3"
}

module "ec2_4" {
  source         = "./modules/ec2"
  count          = var.enable_ec2_4 ? 1 : 0
  first_instance = false

  ami                = var.ec2_ami
  instance_type      = var.ec2_instance_type
  subnet_id          = var.enable_vpc ? module.vpc[0].public_subnet_ids[1] : null
  security_group_ids = var.enable_sg ? [module.sg[0].sg_id] : []
  key_name           = var.create_key_for_ec2 ? aws_key_pair.tf_key[0].key_name : var.existing_key_name
  tags               = var.common_tags
  name               = "${var.name_prefix}-ec2-4"
}

# =========================
# EBS snapshot
# =========================
module "ebs_snapshot" {
  source = "./modules/ebs"
  count  = var.enable_ebs ? 1 : 0

  availability_zone = var.azs[0]
  size_gb           = 1
  tags              = var.common_tags
}
