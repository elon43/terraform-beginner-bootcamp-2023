# https://developer.hashicorp.com/terraform/language/values/outputs
output "bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}