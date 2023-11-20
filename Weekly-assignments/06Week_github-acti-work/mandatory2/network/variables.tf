variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefixes" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "nsg_name" {
  type = string
}

variable "allowed_ip" {
  type    = string
}
