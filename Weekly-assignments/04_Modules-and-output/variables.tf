variable "rgname" {
  type        = string
  description = "Name of the resource group"
  default     = "ez-rg-module04"
}

variable "location" {
  type        = list(string)
  description = "Location of the resource group"
  default     = ["West Europe", "North Europe", "East US"]
}

variable "base_name" {
  type        = string
  description = "Base name of the resources"
  default     = "ez-mod04"
}