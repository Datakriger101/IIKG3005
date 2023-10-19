
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ez-tf-backend"
    storage_account_name = "ezsabetfs66enrhk51w"
    container_name       = "tfstate"
    key                  = "ez.terraform.tfstate"
    # Bruke key for å definere applikasjons om brukes. Noe smart.
  }
}

provider "azurerm" {
  features {}
}
