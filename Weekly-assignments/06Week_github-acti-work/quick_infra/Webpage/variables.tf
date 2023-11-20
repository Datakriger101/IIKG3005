variable "rgname" {
  type        = string
  description = "(optional) describe your variable"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
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

variable "workspace_type" {
  type        = string
  description = "Current workspace type"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resource group"
}

#variable "current_timestamp" {
#  type = string
#  description = "Current timestamp in format YYYY-MM-DD-hh-mm-ss"
#}