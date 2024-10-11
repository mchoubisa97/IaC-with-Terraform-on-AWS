resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "example1" {
  bucket = aws_s3_bucket.example.bucket

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
