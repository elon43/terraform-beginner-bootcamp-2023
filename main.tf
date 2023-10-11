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

// mock
# provider "terratowns" {
#   endpoint = "http://localhost:4567/api"
#   user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
#   token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
# }

# Used access code for taken AND user_uuid.  I entered the access code for my user_uuid when I signed up.
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
#  user_uuid="8fd3b9cf-976e-4b54-be6a-aab0397d8a13" 
  token = var.terratowns_access_token
}


module "terrahouse_aws" {
 source              = "./modules/terrahouse_aws"
 user_uuid           = var.teacherseat_user_uuid
# bucket_name         = var.bucket_name
 index_html_filepath = var.index_html_filepath
 error_html_filepath = var.error_html_filepath
 assets_path         = var.assets_path
 content_version     = var.content_version
}

// mock
# resource "terratowns_home" "home"{
#   name = "Quick Easy Meal"
#   description = <<DESCRIPTION
# This is my go to meal when I want something quick, healthy,
# and fast
# DESCRIPTION    
#   town = "cooker-cove"
#   domain_name = "3fdq3gz.cloudfront.net"
#   content_version = 1
# }

// town
resource "terratowns_home" "home"{
  name = "How to cook southern recipes in 2023!-update"
  description = "test"
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
#  domain_name = "1234.cloudfront.net"
  content_version = 1
}