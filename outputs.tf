# https://developer.hashicorp.com/terraform/language/values/outputs
output "bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}