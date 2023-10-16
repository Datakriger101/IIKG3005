# Resource Group for all resources
resource "azurerm_resource_group" "rg-infra" {
  name     = "${var.rg_name}-${var.base_name}"
  location = var.location
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

resource "random_password" "password" {
<<<<<<< HEAD
  length           = 17
=======
  length           = 15
>>>>>>> cc4ae723caee6f701b8597bdf1bbdd4ce1c6fde7
  special          = true
  override_special = "!%&*()-_=+[]{}<>:?"
}

output "vm_password" {
  value     = azurerm_key_vault_secret.vm_password.value
  sensitive = true
}