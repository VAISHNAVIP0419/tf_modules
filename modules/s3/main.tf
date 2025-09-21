# Generate a random suffix if bucket_name is not provided
resource "random_id" "suffix" {
  count       = var.bucket_name == "" ? 1 : 0
  byte_length = 4
}

# Declare local variable for final bucket name
locals {
  bucket_name_final = var.bucket_name != "" ? var.bucket_name : "${var.bucket_prefix}-${random_id.suffix[0].hex}"
}

# S3 bucket resource
resource "aws_s3_bucket" "this" {
  bucket        = local.bucket_name_final
  force_destroy = var.force_destroy
  tags          = merge(var.tags, { Name = local.bucket_name_final })
}

# Enforce bucket ownership (disables ACLs)
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Optional versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}
