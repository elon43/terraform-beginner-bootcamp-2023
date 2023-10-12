# https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "tcbstefanthompson"

    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_quickmeal_hosting" {
  source    = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.quickmeal.public_path
  content_version     = var.quickmeal.content_version
}

resource "terratowns_home" "home_quickmeal" {
  name        = "Roasted Chicken and Vegetables"
  description = <<DESCRIPTION
This is my favorite recipe when I want a quick and healthy meal.
DESCRIPTION
  domain_name = module.home_quickmeal_hosting.domain_name
  town        = "cooker-cove"
  content_version = var.quickmeal.content_version
}

module "home_videogames_hosting" {
  source    = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_user_uuid
  public_path = var.videogames.public_path
  content_version     = var.videogames.content_version
}

resource "terratowns_home" "home_videogames" {
  name        = "Football Video Games"
  description = <<DESCRIPTION
Here are two video games I enjoyed playing in middle school and high school.
DESCRIPTION
  domain_name = module.home_videogames_hosting.domain_name
  town        = "gamers-grotto"
  content_version = var.videogames.content_version
}
