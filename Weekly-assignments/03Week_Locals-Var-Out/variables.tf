variable "rgname" {
  type        = string
  description = "Name of the resource group"
  default     = "ez-rg-module03"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "West Europe"
}

variable "saname" {
  type        = string
  description = "Name of the storage account"
  default     = "ezsaacmod03"
}

variable "company" {
  type        = string
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "billing_code" {
  type        = string
  description = "Billing code"
}

variable "az_regions" {
  type        = list(string)
  description = "Azure regions for deployment"
  default     = ["West Europe", "North Europe"]
}

variable "vmsize" {
  type        = map(string)
  description = "Map of VM sizes"
  default = {
    "small"  = "Standard_B1s"
    "medium" = "Standard_B2s"
    "large"  = "Standard_B4ms"
  }
}

variable "vmsizelocation" {
  type        = map(string)
  description = "Map of VM sizes for different datacenters locations"
  default = {
    "northeurope" = "Standard_B1s"
    "westeurope"  = "Standard_B2s"
  }
}

variable "nsgname" {
  type        = string
  description = "Name of the Network Security Group"
  default     = "ez-nsg01"
}