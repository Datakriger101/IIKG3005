variable "location" {
  type = string
  default = "westeurope"
}
variable "rg_name" {
  type = string
  default = "ez-rg-web"
}
variable "sa_name" {
  type = string
  default = "ezsa"
}
variable "source_content" {
  type = string
  default = ""
}
variable "index_document" {
  type = string
  default = "index.html"
}