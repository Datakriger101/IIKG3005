
variable "location" {
  type        = string
  description = "Location for the resource"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Name of the resource group"
  default     = "ezkid-rg-module02"
}

variable "saname" {
  type        = string
  description = "Name of the storage account"
  default     = "ezsamod02"
}

variable "vnetname" {
  type = string
  description = "Virtual network name"
  default = "ezkid-vnet-10"
}