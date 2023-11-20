
variable "base_name" {
  type        = string
  description = "Base name for all resources"
}

variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location for all resources"
}

variable "subnet_id" {
  type        = string
  description = "Output of subnet ID for the VM"
}

variable "pip_output" {
  type        = string
  description = "Output of public IP for the VM"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resource group"
}

variable "rsa_ssh_key" {
  type = string
  description = "SSH key for the VM"
}