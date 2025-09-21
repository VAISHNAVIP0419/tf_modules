variable "name" {
  type    = string
  default = "tf-sg"
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "allow_http" {
  type    = bool
  default = true
}

variable "tags" {
  type = map(string)
  default = {}
}