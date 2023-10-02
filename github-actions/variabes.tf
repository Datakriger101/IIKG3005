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
  default = "<h1>Hello, this page was made with Terraform</h1>"
}
variable "index_document" {
  type    = string
  default = "index.html"
} 