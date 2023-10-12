variable "user_uuid" {
    description = "The UUID of the user"
    type = string
}

variable "public_path" {
  description = "The file path for the public directory"
  type        = string
}
variable "content_version" {
  type        = number
  description = "Content version number"
  
  validation {
    condition     = var.content_version > 0
    error_message = "Content version must be a positive integer"
  }
}

