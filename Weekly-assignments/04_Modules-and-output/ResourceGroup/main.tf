resource "azurerm_resource_group" "ezkid-module04-prod" {
  name     = var.rgname
  location = var.location

  tags = var.tags
}