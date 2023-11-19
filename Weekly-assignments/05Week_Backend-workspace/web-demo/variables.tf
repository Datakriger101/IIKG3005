variable "rgname" {
  type        = string
  description = "(optional) describe your variable"
  default     = "ez-rg-web"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "westeurope"
}

variable "saac_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "source_content" {
  type        = string
  description = "(optional) describe your variable"
}

variable "index_document" {
  type        = string
  description = "(optional) describe your variable"
}

#variable "current_timestamp" {
#  type = string
#  description = "Current timestamp in format YYYY-MM-DD-hh-mm-ss"
#}