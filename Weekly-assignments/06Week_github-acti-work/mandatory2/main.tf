terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.org_identifier}-${var.resource_group_name}"
  location = var.location
}

module "network" {
  source              = "./network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  common_tags         = var.common_tags
  vnet_name           = "${var.org_identifier}-${var.vnet_name}"
  subnet_name         = "${var.org_identifier}-${var.subnet_name}"
  nsg_name            = "${var.org_identifier}-${var.nsg_name}"
  allowed_ip          = var.allowed_ip
}

module "storage_account" {
  source                           = "./storage"
  resource_group_name              = azurerm_resource_group.rg.name
  location                         = var.location
  common_tags                      = var.common_tags
  storage_account_name             = "${var.org_identifier}${var.storage_account_name}"
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  storage_container_name           = "${var.org_identifier}${var.storage_container_name}"
  key_vault_id                     = module.key_vault.key_vault_id
  depends_on                       = [module.key_vault.key_access_policy]
}

module "virtual_machine" {
  source              = "./vm"
  org_identifier      = var.org_identifier
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  common_tags         = var.common_tags
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  vm_size             = var.vm_size
  key_vault_id        = module.key_vault.key_vault_id
  subnet_id           = module.network.subnet_id
  depends_on          = [module.key_vault.key_access_policy]
  
  vm_publisher = var.vm_publisher
  vm_offer     = var.vm_offer
  vm_sku       = var.vm_sku
  vm_version   = var.vm_version
}

module "key_vault" {
  source              = "./key_vault"
  key_vault_name      = "${var.org_identifier}-${var.key_vault_name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  key_vault_sku       = var.key_vault_sku
  common_tags         = var.common_tags
}
