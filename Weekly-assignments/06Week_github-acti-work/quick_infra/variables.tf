variable "rgname" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = list(string)
  description = "Location of the resource group"
}

variable "base_name" {
  type        = string
  description = "Base name of the resources"
}

variable "billing_code" {
  type        = string
  description = "Billing code for the resources"
}

variable "saac_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "source_content" {
  type        = string
  description = "(optional) describe your variable"
}

variable "index_document" {
  type        = string
  description = "(optional) describe your variable"
}

#variable "current_timestamp" {
#  type = string
#  description = "Current timestamp in format YYYY-MM-DD-hh-mm-ss"
#}

### Var for tags
variable "department_inf" {
  type        = string
  description = "Infrastructure"
}

variable "department_economy" {
  type        = string
  description = "Ecconomy"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "owner_name" {
  type        = string
  description = "Owner name"
}