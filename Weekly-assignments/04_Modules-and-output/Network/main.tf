

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random" {
  count = 2 # Number of random strings to generate

  length  = 5
  special = false
  upper   = false
}


resource "azurerm_network_security_group" "ez-nsg" {
  name                = "${var.base_name}-nsg"
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "production-nsg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "178.232.227.126" # Må endres til sin brukte IP
    destination_address_prefix = "*"
  }

  tags = var.tags
}

resource "azurerm_virtual_network" "ez-vnet" {
  name                = "${var.base_name}-vnet"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = var.tags
}

# Jeg sier ikke at det er god praksis å ha random gen navn på subnet...
# men jeg ønsket å ha det med her fordi jeg kan
resource "azurerm_subnet" "ez-subnet" {
  count = 2

  name                 = "${var.base_name}-subnet-${random_string.random[count.index].result}"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.ez-vnet.name
  address_prefixes     = ["10.0.${count.index}.0/24"]
}

# Her har vi at bare subnet 0 skal ha en NSG
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.ez-subnet[0].id
  network_security_group_id = azurerm_network_security_group.ez-nsg.id

}

resource "azurerm_public_ip" "ez-pip-mod04" {
  name                = "ez-pip-linux"
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = "Static"
}