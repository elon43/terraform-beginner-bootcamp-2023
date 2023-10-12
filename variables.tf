variable "terratowns_endpoint" {
  description = "The url for terratowns"
  type        = string
}

variable "terratowns_access_token" {
  description = "The access code"
  type        = string
}
variable "teacherseat_user_uuid" {
  description = "The UUID of the user"
  type        = string
}

variable "quickmeal" {
  type = object ({
    public_path = string
    content_version = number
})
}
variable "videogames" {
  type = object ({
    public_path = string
    content_version = number
})
}

