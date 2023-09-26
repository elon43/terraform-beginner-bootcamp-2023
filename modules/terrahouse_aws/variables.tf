variable user_uuid {
    description = "The UUID of the user"
    type = string
}

variable "bucket_name" {
  description = "The name of the AWS S3 bucket"
  type        = string

/*  validation {
    condition     = regex("^[a-z0-9][a-z0-9.-]{1,64}[a-z0-9]$", var.bucket_name)
    error_message = "Bucket name must be between 3 and 64 characters, start and end with a lowercase letter or number, and only contain lowercase letters, numbers, hyphens, and periods."
  }
*/
}
