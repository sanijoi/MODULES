resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}
resource "aws_s3_bucket_public_access_block" "s3_block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = true 
  block_public_policy     = true 
  ignore_public_acls      = true 
  restrict_public_buckets = true 
}