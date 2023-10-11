
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ez-tg-backend-tfstate"
    storage_account_name = "sabetfs8w79oreppe"
    container_name       = "tfstate"
    key                  = "ga-test.terraform.tfstate"
    # Bruke key for å definere applikasjons om brukes. Noe smart.
  }
}

provider "azurerm" {
  features {}
}
