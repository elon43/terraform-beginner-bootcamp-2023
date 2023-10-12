# https://developer.hashicorp.com/terraform/language/values/outputs
output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.home_quickmeal_hosting.bucket_name
}

output "s3_website_endpoint" {
  description = "s3 static website hosting endpoint"
  value       = module.home_quickmeal_hosting.website_endpoint
}

output "domain_name" {
  description = "Cloudfront distribution domain name"
  value       = module.home_quickmeal_hosting.domain_name
}