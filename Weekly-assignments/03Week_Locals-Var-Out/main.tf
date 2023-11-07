

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
  tags     = local.tags_generic
}

resource "azurerm_storage_account" "ez-saac" {
  count = 2 # Lager 2 stk

  name                     = "${var.saname}${count.index}"
  resource_group_name      = azurerm_resource_group.ez-rgwe.name
  location                 = azurerm_resource_group.ez-rgwe.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Bruker bare local.tags da er "resourcen" som er definert over
  tags = local.tags_generic
}


# Network Security Group
resource "azurerm_network_security_group" "ez-nsgwe-internal" {
  name                = "${var.nsgname}-internal"
  location            = azurerm_resource_group.ez-rgwe.location
  resource_group_name = azurerm_resource_group.ez-rgwe.name

  tags = local.vnet-internal

}

resource "azurerm_network_security_group" "ez-nsgwe-external" {
  name                = "${var.nsgname}-external"
  location            = azurerm_resource_group.ez-rgwe.location
  resource_group_name = azurerm_resource_group.ez-rgwe.name

  tags = local.vnet-external
}

# Fikk ikke helt til å lage 

# Virtual Network 1
resource "azurerm_virtual_network" "ez-vnwe-01" {
  name                = "ez-vnet-01"
  location            = azurerm_resource_group.ez-rgwe.location
  resource_group_name = azurerm_resource_group.ez-rgwe.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]

  subnet {
    name           = "sn-01-01"
    address_prefix = "10.1.1.0/24"
    security_group = azurerm_network_security_group.ez-nsgwe-internal.id
  }

  subnet {
    name           = "sn-01-02"
    address_prefix = "10.1.2.0/24"
    security_group = azurerm_network_security_group.ez-nsgwe-external.id
  }

  tags = local.tags_generic
}

# Virtual Network 2
resource "azurerm_virtual_network" "ez-vnwe-02" {
  name                = "ez-vnet-02"
  location            = azurerm_resource_group.ez-rgwe.location
  resource_group_name = azurerm_resource_group.ez-rgwe.name
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.2.0.4", "10.2.0.5"]

  subnet {
    name           = "sn-02-01"
    address_prefix = "10.2.1.0/24"
    security_group = azurerm_network_security_group.ez-nsgwe-internal.id
  }

  subnet {
    name           = "sn-02-02"
    address_prefix = "10.2.2.0/24"
    security_group = azurerm_network_security_group.ez-nsgwe-external.id
  }

  tags = local.tags_generic
}

output "saacid" {
  value = azurerm_resource_group.ez-rgwe.id
}

output "ezrgwe-name" {
  value = azurerm_resource_group.ez-rgwe.name
}