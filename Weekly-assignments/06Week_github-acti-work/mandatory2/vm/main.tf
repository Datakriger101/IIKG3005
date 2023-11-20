resource "random_password" "vm_password" {
  count   = var.instance_count 
  length  = 16
  special = true
}

resource "azurerm_public_ip" "pip" {
  count               = var.instance_count
  name                = "${var.org_identifier}-${var.vm_name}-pip-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "main" {
  count                 = var.instance_count
  name                  = "${var.org_identifier}-${var.vm_name}-nic-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name

  ip_configuration {
    name                          = "ip"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[count.index].id
  }
}



resource "azurerm_virtual_machine" "vm" {
  count                 = var.instance_count
  name                  = "${var.org_identifier}-${var.vm_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[count.index].id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  storage_os_disk {
    name              = "${var.org_identifier}-${var.vm_name}-osdisk-${count.index + 1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.vm_name}-${count.index + 1}"
    admin_username = var.admin_username
    admin_password = random_password.vm_password[count.index].result
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = var.common_tags
}

resource "azurerm_key_vault_secret" "vm_password_secret" {
  count        = var.instance_count
  name         = "${var.org_identifier}-${var.vm_name}-vmPasswordSecret-${count.index + 1}"
  value        = random_password.vm_password[count.index].result 
  key_vault_id = var.key_vault_id 
}
