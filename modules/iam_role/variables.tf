variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to allow access to"
  type        = string
}
