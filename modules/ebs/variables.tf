variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

variable "size_gb" {
  type    = number
  default = 1
}

variable "tags" {
  type = map(string)
  default = {}
}