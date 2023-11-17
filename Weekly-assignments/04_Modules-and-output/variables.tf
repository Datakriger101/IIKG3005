variable "rgname" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = list(string)
  description = "Location of the resource group"
}

variable "base_name" {
  type        = string
  description = "Base name of the resources"
}

variable "tags_billing" {
  type        = string
  description = "Tags for billing"
}