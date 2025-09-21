variable "bucket_prefix" {
  type    = string
  default = "tf-simple-bucket"
}

variable "bucket_name" {
  type        = string
  default     = ""
  description = "If empty, prefix + random suffix will be used."
}

variable "versioning" {
  type    = bool
  default = false
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
