terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ez-tf-backend"          # Resource group name
    storage_account_name = "ezsabetfs66enrhk51w"    # Storage account name
    container_name       = "ezsc"                   # Storage container name
    key                  = "ez.terraform.tfstate"   # State file name
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}