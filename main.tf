# =========================
# VPC module
# =========================
module "vpc" {
  source = "./modules/vpc"

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

  name       = "${var.name_prefix}-sg"
  vpc_id     = module.vpc.vpc_id
  ssh_cidr   = var.ssh_cidr
  allow_http = true
  tags       = var.common_tags
}

# =========================
# S3 module
# =========================
module "s3" {
  source = "./modules/s3"

  bucket_prefix = var.s3_bucket_prefix
  versioning    = false
  tags          = var.common_tags
}

# =========================
# Generate SSH key once
# =========================
resource "tls_private_key" "tf_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf_key" {
  key_name   = var.ec2_key_name
  public_key = tls_private_key.tf_key.public_key_openssh
}

# =========================
# EC2 Instances
# =========================
module "ec2_1" {
  source        = "./modules/ec2"
  first_instance = true

  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.sg.sg_id]
  key_name          = aws_key_pair.tf_key.key_name
  tags              = var.common_tags
  name              = "${var.name_prefix}-ec2-1"
}

module "ec2_2" {
  source         = "./modules/ec2"
  first_instance = false

  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = module.vpc.public_subnet_ids[1]
  security_group_ids = [module.sg.sg_id]
  key_name          = aws_key_pair.tf_key.key_name
  tags              = var.common_tags
  name              = "${var.name_prefix}-ec2-2"
}

module "ec2_3" {
  source         = "./modules/ec2"
  first_instance = false

  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.sg.sg_id]
  key_name          = aws_key_pair.tf_key.key_name
  tags              = var.common_tags
  name              = "${var.name_prefix}-ec2-3"
}

module "ec2_4" {
  source         = "./modules/ec2"
  first_instance = false

  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = module.vpc.public_subnet_ids[1]
  security_group_ids = [module.sg.sg_id]
  key_name          = aws_key_pair.tf_key.key_name
  tags              = var.common_tags
  name              = "${var.name_prefix}-ec2-4"
}

# =========================
# EBS snapshot
# =========================
module "ebs_snapshot" {
  source            = "./modules/ebs"
  availability_zone = var.azs[0]
  size_gb           = 1
  tags              = var.common_tags
}