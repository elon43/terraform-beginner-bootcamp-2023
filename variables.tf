variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
}
variable "bucket_name" {
  description = "The name of the AWS S3 bucket"
  type        = string
}
variable "index_html_filepath" {
  description = "This is the directory where the index.html file is located"
  type        = string
}
variable "error_html_filepath" {
  description = "This is the directory where the error.html file is located"
  type        = string
}