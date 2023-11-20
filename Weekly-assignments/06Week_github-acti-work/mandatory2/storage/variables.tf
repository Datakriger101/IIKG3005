variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_tier" {
  type = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string
  default = "LRS"
}

variable "storage_container_name" {
  type = string
}

variable "key_vault_id" {
  type = string
}

variable "instance_count" {
  description = "Number of instances to create"
  default     = 1
}
