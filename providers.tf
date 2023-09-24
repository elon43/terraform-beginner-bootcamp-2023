# https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
# https://registry.terraform.io/providers/hashicorp/random/latest
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
#   cloud {
#     organization = "tcbstefanthompson"

#     workspaces {
#       name = "terra-house-1"
#     }
#   }
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