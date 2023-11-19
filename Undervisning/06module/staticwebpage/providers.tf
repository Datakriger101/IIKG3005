
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.81.0"
    }
  }

  // Her må verdiene endres slik at de passer
  backend "azurerm" {
    resource_group_name  = "ez-rg-mod05-backend"
    storage_account_name = "ezsaacbackend92x1ikov"
    container_name       = "tfstate"
    key                  = "mod06/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

}