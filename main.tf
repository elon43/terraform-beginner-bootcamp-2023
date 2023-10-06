# https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #   cloud {
  #     organization = "tcbstefanthompson"

  #     workspaces {
  #       name = "terra-house-1"
  #     }
  #   }
}

provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}
#module "terrahouse_aws" {
#  source              = "./modules/terrahouse_aws"
#  user_uuid           = var.user_uuid
#  bucket_name         = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  assets_path         = var.assets_path
#  content_version     = var.content_version
#}

resource "terratowns_home" "home"{
  name = "How to cook southern recipes in 2023!"
  description = <<DESCRIPTION
Simple Description 
DESCRIPTION
  town = "cooker-cove"
#  domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "123456.cloudfront.net"
  content_version = 1
}