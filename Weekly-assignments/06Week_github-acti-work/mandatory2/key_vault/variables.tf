variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "key_vault_sku" {
  type        = string
  description = "SKU Name for the Azure Key Vault"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
