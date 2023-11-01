variable "rg_location" {
  type    = string
  default = "North Europe"
}
variable "rg_name" {
  type    = string
  default = "rg-web-ezkid"
}
variable "sa_name" {
  type    = string
  default = "saweb"
}
variable "source_content" {
  type    = string
  default = "<h1>Hello CI/CD, this page was made with Terraform 2.5</h1><p>Update del 1</p>"
}
variable "index_document" {
  type    = string
  default = "index.html"
} 