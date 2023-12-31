#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "website_bucket" {
# We want to assign a random bucket name
#  bucket = var.bucket_name
  tags = {
    UserUuid = var.user_uuid
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#Uploading a file to a S3 bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${var.public_path}/index.html"
  content_type = "text/html"

  etag = filemd5("${var.public_path}/index.html")
  lifecycle {
    ignore_changes = [ etag ]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_object" "upload_assets" {
  for_each = fileset("${var.public_path}/assets","*.{jpg,png,gif,bmp}")
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "assets/${each.key}"
  source = "${var.public_path}/assets/${each.key}"

  etag = filemd5("${var.public_path}/assets/${each.key}")
  lifecycle {
    ignore_changes = [ etag ]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_object" "error_html" {
# https://developer.hashicorp.com/terraform/language/functions/fileset
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = "${var.public_path}/error.html"
  content_type = "text/html"

  etag = filemd5("${var.public_path}/error.html")
  lifecycle {
    ignore_changes = [ etag ]
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id
#  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode({
    "Version" = "2008-10-17",
    "Id"= "PolicyForCloudFrontPrivateContent",
    "Statement"= [
	    {
		    "Sid"= "AllowCloudFrontServicePrincipal",
		    "Effect"= "Allow",
		    "Principal"= {
			  "Service"= "cloudfront.amazonaws.com"
	    },
		    "Action"= "s3:GetObject",
		    "Resource"= "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
		    "Condition"= {
			    "StringEquals"= {
				    "AWS:SourceArn": "${aws_cloudfront_distribution.s3_distribution.arn}"
                }
            }
        }
    ]   
    }
  )
}

#https://developer.hashicorp.com/terraform/language/resources/terraform-data
resource "terraform_data" "content_version" {
  input = var.content_version  
}





