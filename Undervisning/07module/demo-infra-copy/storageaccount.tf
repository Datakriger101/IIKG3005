resource "azurerm_storage_account" "sa" {
  name                     = "${var.sa_name}${var.base_name}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg-infra.name
  location                 = azurerm_resource_group.rg-infra.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "sc" {
  name                  = "${var.sc_name}${var.base_name}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

# Legger til flere kommentarer