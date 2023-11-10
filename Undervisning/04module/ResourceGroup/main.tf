resource "azurerm_resource_group" "ezkid-mod04-demo-rg" {
  name     = "rg-${var.base_name}"
  location = var.location
}