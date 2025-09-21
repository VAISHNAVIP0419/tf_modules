# VPC module (simple public subnets and IGW)
module "vpc" {
  source = "./modules/vpc"
  count  = var.enable_vpc ? 1 : 0

  name           = "simple-vpc"
  cidr           = "10.0.0.0/16"
  azs            = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

# Security Group module (uses vpc if created)
module "sg" {
  source = "./modules/sg"
  count  = var.enable_sg ? 1 : 0

  name               = "simple-sg"
  vpc_id             = var.enable_vpc ? module.vpc[0].vpc_id : ""
  ssh_cidr_blocks    = ["0.0.0.0/0"]
  web_cidr_blocks    = ["0.0.0.0/0"]
  tags               = { Environment = "dev" }
}

# EC2 instances - 4 simple module calls (comment any module block to destroy/recreate that instance)
module "ec2_server_1" {
  source = "./modules/ec2"
  count  = var.enable_ec2_1 ? 1 : 0

  name              = "server-1"
  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t3.micro"
  subnet_id         = var.enable_vpc ? module.vpc[0].public_subnet_ids[0] : ""
  security_group_ids = var.enable_sg ? [module.sg[0].security_group_id] : []
  create_key        = true     # <-- create a key from local public key file
  public_key_path   = var.public_key_path
  tags              = { Environment = "dev" }
}

module "ec2_server_2" {
  source = "./modules/ec2"
  count  = var.enable_ec2_2 ? 1 : 0

  name              = "server-2"
  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t3.micro"
  subnet_id         = var.enable_vpc ? module.vpc[0].public_subnet_ids[1] : ""
  security_group_ids = var.enable_sg ? [module.sg[0].security_group_id] : []
  create_key        = false    # <-- use existing key name
  existing_key_name = "my-existing-key"  # set your existing key name if using false
  tags              = { Environment = "dev" }
}

module "ec2_server_3" {
  source = "./modules/ec2"
  count  = var.enable_ec2_3 ? 1 : 0

  name              = "server-3"
  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t3.micro"
  subnet_id         = var.enable_vpc ? module.vpc[0].public_subnet_ids[2] : ""
  security_group_ids = var.enable_sg ? [module.sg[0].security_group_id] : []
  create_key        = false
  existing_key_name = "my-existing-key"
  tags              = { Environment = "dev" }
}

module "ec2_server_4" {
  source = "./modules/ec2"
  count  = var.enable_ec2_4 ? 1 : 0

  name              = "server-4"
  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t3.micro"
  subnet_id         = var.enable_vpc ? module.vpc[0].public_subnet_ids[0] : ""
  security_group_ids = var.enable_sg ? [module.sg[0].security_group_id] : []
  create_key        = false
  existing_key_name = "my-existing-key"
  tags              = { Environment = "dev" }
}

# S3 module - optional
module "s3" {
  source = "./modules/s3"
  count  = var.enable_s3 ? 1 : 0

  bucket_name = "simple-tf-bucket-${substr(md5(timestamp()),0,6)}"
  versioning  = false
  tags        = { Environment = "dev" }
}

# EBS snapshot module (creates 1 GiB volume and snapshot)
module "ebs_snapshot" {
  source = "./modules/ebs"
  count  = var.enable_ebs_snapshot ? 1 : 0

  name = "test-ebs"
  az   = "ap-south-1a"
  size = 1
  create = true
  tags = { Environment = "dev" }
}