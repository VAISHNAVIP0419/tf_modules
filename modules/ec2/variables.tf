variable "name" {
  type    = string
  default = "simple-ec2"
}

variable "ami" {
  type    = string
  default = "ami-0f58b397bc5c1f2e8"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

# key handling
variable "create_key" {
  type    = bool
  default = false
}

variable "existing_key_name" {
  type    = string
  default = ""
}

# optional name for created key
variable "key_name" {
  type    = string
  default = ""
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "root_volume_size" {
  type    = number
  default = 8
}

variable "tags" {
  type    = map(string)
  default = {}
}