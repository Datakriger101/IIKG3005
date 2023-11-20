resource "azurerm_resource_group" "ez-rg-module06" {
  name     = var.rgname
  location = var.location

  tags = var.tags
}