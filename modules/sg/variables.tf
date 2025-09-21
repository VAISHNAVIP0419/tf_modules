variable "name" {
  type    = string
  default = "simple-sg"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "ssh_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "web_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "description" {
  type    = string
  default = "Simple SG"
}

variable "tags" {
  type    = map(string)
  default = {}
}
