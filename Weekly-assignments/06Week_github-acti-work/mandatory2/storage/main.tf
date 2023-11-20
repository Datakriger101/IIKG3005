resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = var.common_tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}

resource "azurerm_key_vault_secret" "storage_account_key" {
  count        = var.instance_count
  name         = "${var.storage_account_name}-StorageAccountSecret"
  value        = azurerm_storage_account.storage_account.primary_access_key
  key_vault_id = var.key_vault_id 
  depends_on = [
    azurerm_storage_account.storage_account,
  ]
}
