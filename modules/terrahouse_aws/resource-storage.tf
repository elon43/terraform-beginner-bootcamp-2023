#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
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
  source = var.index_html_filepath
  content_type = "text/html"

  etag = filemd5(var.index_html_filepath)
}
resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath
  content_type = "text/html"

  etag = filemd5(var.error_html_filepath)
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
