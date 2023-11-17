
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
}


provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "ezkid-module04-prod" {
  name     = var.rgname
  location = var.location[0]
}

module "ResourceGroup" {
  source   = "./ResourceGroup"
  rgname   = var.rgname
  location = var.location[0]
  tags     = local.tags_billing

}

module "Network" {
  source    = "./Network"
  
  # Gjorde dette for å vise at man ikke trenge outputs hvis man 
  # har resourcegroup i root module. 
  rgname    = azurerm_resource_group.ezkid-module04-prod.name
  location  = var.location[0]
  base_name = var.base_name
  tags      = local.tags_network

}

module "VirtualMachine" {
  source     = "./VirtualMachine"
  rgname     = module.ResourceGroup.rg_name_output
  location   = var.location[0]
  base_name  = var.base_name
  subnet_id  = module.Network.subnet_id_output
  pip_output = module.Network.pip_output
  tags       = local.tags_vm

}