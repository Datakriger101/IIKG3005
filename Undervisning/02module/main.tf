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


resource "azurerm_resource_group" "ezkid-rg-module02" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_network_security_group" "ezkid-nsg-module02" {
  name                = "ezkid-nsg-mod02"
  location            = azurerm_resource_group.ezkid-rg-module02.location
  resource_group_name = azurerm_resource_group.ezkid-rg-module02.name
}

resource "azurerm_virtual_network" "ez-vnet01-mod02" {
  name                = var.vnetname
  location            = azurerm_resource_group.ezkid-rg-module02.location
  resource_group_name = azurerm_resource_group.ezkid-rg-module02.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]

  subnet {
    name           = "sn01"
    address_prefix = "10.1.1.0/24"
  }

  subnet {
    name           = "sn02"
    address_prefix = "10.1.2.0/24"
    security_group = azurerm_network_security_group.ezkid-nsg-module02.id
  }

}

# Storage account
resource "azurerm_storage_account" "ezkid-sa-module02" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.ezkid-rg-module02.name
  location                 = azurerm_resource_group.ezkid-rg-module02.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}