# Default er definert med D for for å se hvis noe går galt med .tfvars

variable "rg_backend_name" {
  type        = string
  description = "Name of the resource group for the backend"
  default     = "dez-rg-backend"
}

variable "location" {
  type        = list(string)
  description = "Location of the backend"
  default     = ["westeurope", "northeurope"]
}

variable "saac_backend_name" {
  type        = string
  description = "Name of the storage account for the backend"
  default     = "dezsaacbackend"
}

variable "sc_backend_name" {
  type        = string
  description = "Name of the storage container for the backend"
  default     = "tfstate"
}

variable "kv_backend_name" {
  type        = string
  description = "dez-kv-backend"
  default     = "dez-kv-backend"
}

variable "sa_backend_accesskey_name" {
  type        = string
  description = "Name of the storage account access key for the backend"
  default     = "dez-sa-backend-accesskey"
}