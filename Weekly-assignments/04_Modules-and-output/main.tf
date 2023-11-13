
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
  rgname    = module.ResourceGroup.rg_name_output
  location  = var.location[0]
  base_name = var.base_name
  tags = local.tags_nsg

}

module "VirtualMachine" {
  source = "./VirtualMachine"
  #rgname = module.ResourceGroup.rg_name_output
  #location = var.location[0]

}