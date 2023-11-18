
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.81.0"
    }
  }

  // Her må verdiene endres slik at de passer
  backend "azurerm" {
    resource_group_name  = "ez-rg-backend-mod05"
    storage_account_name = "ezsaacbackendr2he8fqf"
    container_name       = "tfstate"
    key                  = "testing.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

}