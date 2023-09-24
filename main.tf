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
  tags = {
    UserUuid = "123456"

  }
}

