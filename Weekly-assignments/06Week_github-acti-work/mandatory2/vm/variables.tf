variable "org_identifier" {
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}


variable "key_vault_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "instance_count" {
  description = "Number of instances to create"
  default     = 1
}

// Defining specifics for VM
variable "vm_publisher" {
  type = string
}

variable "vm_offer" {
  type = string
}

variable "vm_sku" {
  type = string
}

variable "vm_version" {
  type = string
}