# https://developer.hashicorp.com/terraform/language/values/outputs
output "random_bucket_name" {
  value = random_string.random.result
}