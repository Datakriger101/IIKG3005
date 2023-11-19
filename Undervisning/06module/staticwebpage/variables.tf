variable "rg_location" {
  type    = string
  description = "Azure Region for the Resource Group"
  default = "North Europe"
}
variable "rg_name" {
  type    = string
  description = "Resource Group Name"
  default = "ez-rg-module06"
}
variable "sa_name" {
  type    = string
  description = "Storage Account Name"
  default = "saweb"
}
variable "source_content" {
  type    = string
  description = "Source content for the index.html file"
  default = "Hello CI/CD, this page was made with Terraform 2.5"
}
variable "index_document" {
  type    = string
  description = "Index document for the static website"
  default = "index.html"
} 

variable "more_source_content" {
  type = string
  description = "Just more of the good stuff"
  default = "Yeah superman was here"
}