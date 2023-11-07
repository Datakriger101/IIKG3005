terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "ezkid-fs-rg" {
  name     = "rg-ezkid-fs-01"
  location = "West Europe"
}

resource "azurerm_storage_account" "ezkid-sa" {
  name = "ezkidfs0101"

  # Når vi spesifiserer slik, vil den være dependent på resource group
  resource_group_name      = azurerm_resource_group.ezkid-fs-rg.name
  location                 = azurerm_resource_group.ezkid-fs-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}