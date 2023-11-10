resource "azurerm_virtual_network" "ez-vnet-mod04" {
  name                = "ez-vnet-mod04"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "demo-sn" {
  name                 = "sn-01-vnet"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.ez-vnet-mod04.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "ez-nsg-mod04" {
  name                = "${var.base_name}-nsg"
  resource_group_name = var.rgname
  location            = var.location

  security_rule {
    name                       = "Allow-Public-IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "88.95.175.237"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.demo-sn.id
  network_security_group_id = azurerm_network_security_group.ez-nsg-mod04.id
}

resource "azurerm_public_ip" "ez-pip-mod04" {
  name                = "ez-pip-linux"
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "ez-nic-mod04" {
  name                = "ez-nic-mod04-01"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.demo-sn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ez-pip-mod04.id
  }
}

resource "azurerm_linux_virtual_machine" "ez-linux-vm-mod04" {
  name                = "example-machine"
  resource_group_name = var.rgname
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "yeyman!boss2xy"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.ez-nic-mod04.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}