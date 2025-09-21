variable "bucket_name" {
  type    = string
  default = "simple-tf-bucket"
}

variable "versioning" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}