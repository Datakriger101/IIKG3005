variable "rg_backend_name" {
  type        = string
  description = "Name of the Resource Group backend"
}

variable "rg_backend_location" {
  type        = string
  description = "Name of the Resource Group backend"
}

variable "sa_backend_name" {
  type        = string
  description = "Name of the Storage Accoount backend"
}

variable "sc_backend_name" {
  type        = string
  description = "Name of the Storage Container backend"
}

variable "sa_backend_accesskey_name" {
  type        = string
  description = "Name of access key  for storage account"
}

variable "kv_backend_name" {
  type        = string
  description = "Name of keyvault backend"
}
