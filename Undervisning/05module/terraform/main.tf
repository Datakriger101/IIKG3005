locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rgname = "${var.rgname}-${local.workspaces_suffix}"
}

resource "azurerm_resource_group" "ez-rg-mod05" {
  name     = local.rgname
  location = var.location

}

output "rg_name" {
  value = azurerm_resource_group.ez-rg-mod05.name

}