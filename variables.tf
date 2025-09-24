# General
variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "name_prefix" {
  type    = string
  default = "tf-simple"
}

# VPC defaults (safe)
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

# Module switches (toggle to create/destroy)
variable "enable_vpc" {
  type    = bool
  default = true
}

variable "enable_sg" {
  type    = bool
  default = true
}

variable "enable_s3" {
  type    = bool
  default = false
}

variable "enable_ec2_1" {
  type    = bool
  default = true
}

variable "enable_ec2_2" {
  type    = bool
  default = false
}

variable "enable_ec2_3" {
  type    = bool
  default = true
}

variable "enable_ec2_4" {
  type    = bool
  default = false
}

variable "enable_ebs" {
  type    = bool
  default = false
}


# EC2 defaults (free-tier friendly)
variable "ec2_ami" {
  type    = string
  default = "ami-0f58b397bc5c1f2e8"
}
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

# SSH / Keys
variable "create_key_for_ec2" {
  type        = bool
  default     = true
  description = "If true, generate key locally with tls and create aws_key_pair. If false, use existing_key_name."
}
variable "existing_key_name" {
  type        = string
  default     = "lab-key"
  description = "If create_key_for_ec2=false, set this to your existing key name in AWS."
}
variable "ec2_key_name" {
  type        = string
  default     = "tf-ec2-key"
  description = "Name to use when creating key-pair in AWS (if create_key_for_ec2=true)."
}

# S3
variable "s3_bucket_prefix" {
  type    = string
  default = "tf-simple-bucket"
}

# Simple CIDR for SSH access
variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

# Common tags
variable "common_tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "vaishnavi"
  }
}