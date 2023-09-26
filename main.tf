# https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
#   cloud {
#     organization = "tcbstefanthompson"

#     workspaces {
#       name = "terra-house-1"
#     }
#   }
}

module terrahouse_aws {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}  
