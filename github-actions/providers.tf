
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tg-backend-tfstate"
    storage_account_name = "sabetfshpsjd765hc"
    container_name       = "tfstate"
    key                  = "ga-test.terraform.tfstate"
    # Bruke key for å definere applikasjons om brukes. Noe smart.
  }
}

provider "azurerm" {
  features {}
}
