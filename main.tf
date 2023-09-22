# https://registry.terraform.io/providers/hashicorp/random/latest
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}
provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "random" {
  length  = 16
  special = false
}
# https://developer.hashicorp.com/terraform/language/values/outputs
output "random_bucket_name" {
  value = random_string.random.result
}