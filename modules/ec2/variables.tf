variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type    = list(string)
  default = []
}
variable "name" {}
variable "key_name" {}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "first_instance" {
  type    = bool
  default = false
}