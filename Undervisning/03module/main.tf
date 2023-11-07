

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.79.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

# Flytter locals til egen fil
resource "azurerm_resource_group" "ez-rgwe" {
  name     = var.rgname
  location = var.az_regions[1]
  tags     = local.tags
}

resource "azurerm_storage_account" "example" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.ez-rgwe.name
  location                 = azurerm_resource_group.ez-rgwe.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Bruker bare local.tags da er "resourcen" som er definert over
  tags = local.tags
}

output "saacid" {
  value = azurerm_resource_group.ez-rgwe.id
}