variable "name" {
  type    = string
  default = "test-ebs"
}

variable "az" {
  type    = string
  default = "ap-south-1a"
}

variable "size" {
  type    = number
  default = 1
}

variable "create" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}