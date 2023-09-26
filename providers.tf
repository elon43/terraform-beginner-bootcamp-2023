# https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
#   cloud {
#     organization = "tcbstefanthompson"

#     workspaces {
#       name = "terra-house-1"
#     }
#   }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
}