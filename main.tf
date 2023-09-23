# https://registry.terraform.io/providers/hashicorp/random/latest
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}
provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "random" {
  length  = 32
  special = false
  #lower = true
  min_lower = 32
}


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  bucket = random_string.random.result
}

# https://developer.hashicorp.com/terraform/language/values/outputs
output "random_bucket_name" {
  value = random_string.random.result
}