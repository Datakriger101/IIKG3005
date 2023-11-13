

resource "azurerm_network_security_group" "ez-nsg" {
  name                = "${var.base_name}-nsg"
  location            = var.location
  resource_group_name = var.rgname

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

resource "azurerm_subnet" "ez-subnet" {
  count = 2

  name                 = "${var.base_name}-subnet-${count.index}"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.ez-vnet.name
  address_prefixes     = ["10.0.${count.index}.0/24"]

}