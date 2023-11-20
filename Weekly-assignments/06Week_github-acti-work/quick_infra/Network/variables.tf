variable "rgname" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "base_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resource group"
}