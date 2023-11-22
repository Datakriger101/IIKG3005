variable "rgname" {
  type        = string
  description = "(optional) describe your variable"
  default     = "ez-rg-module05-web"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "westeurope"
}

variable "saac_name" {
  type        = string
  description = "(optional) describe your variable"
  default = "saacweb"
}

variable "source_content" {
  type        = string
  description = "(optional) describe your variable"
  default = "<h1>Webpage created with Terraform</h1>"
}

variable "index_document" {
  type        = string
  description = "(optional) describe your variable"
  default = "index.html"
}

#variable "current_timestamp" {
#  type = string
#  description = "Current timestamp in format YYYY-MM-DD-hh-mm-ss"
#}
