terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}

provider "azurerm" {
  features {}

}


module "ResourceGroup" {
  source    = "./ResourceGroup"
  base_name = "ez-mod04"
  location  = "West Europe"
}

module "StorageAccount" {
  source    = "./StorageAccount"
  base_name = "EZsaacmod04"
  rgname    = module.ResourceGroup.rg_name_output
  location  = "West Europe"
}

module "VirtualNetwork" {
  source    = "./VirtualNetwork"
  base_name = "ez-mod04"
  rgname    = module.ResourceGroup.rg_name_output
  location  = "West Europe"

}