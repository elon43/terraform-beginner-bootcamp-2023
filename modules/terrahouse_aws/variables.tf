variable "user_uuid" {
    description = "The UUID of the user"
    type = string
}

# variable "bucket_name" {
#   description = "The name of the AWS S3 bucket"
#   type        = string

# /*  validation {
#     condition     = regex("^[a-z0-9][a-z0-9.-]{1,64}[a-z0-9]$", var.bucket_name)
#     error_message = "Bucket name must be between 3 and 64 characters, start and end with a lowercase letter or number, and only contain lowercase letters, numbers, hyphens, and periods."
#   }
# */
# }

variable "index_html_filepath" {
  description = "Path to the index.html file"
  type        = string
  validation {
    condition     = fileexists((var.index_html_filepath))
    error_message = "The specified index.html file does not exist."
  }
}
variable "error_html_filepath" {
  description = "Path to the error.html file"
  type        = string
  validation {
    condition     = fileexists((var.error_html_filepath))
    error_message = "The specified error.html file does not exist."
  }
}

variable "content_version" {
  type        = number
  description = "Content version number"
  
  validation {
    condition     = var.content_version > 0
    error_message = "Content version must be a positive integer"
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}