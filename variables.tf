variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

# toggles — change to true to create that module, false to skip
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
  default = false
}

variable "enable_ec2_2" {
  type    = bool
  default = false
}

variable "enable_ec2_3" {
  type    = bool
  default = false
}

variable "enable_ec2_4" {
  type    = bool
  default = false
}

variable "enable_ebs_snapshot" {
  type    = bool
  default = false
}


# public key file for creating aws_key_pair (used when create_key = true)
# default set as the path you asked for
variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}