data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.key_vault_sku
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = var.common_tags
}

resource "azurerm_key_vault_access_policy" "access_policy" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

   key_permissions = [
    "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore",
    ]

   secret_permissions = [
    "Get", "List", "Delete", "Recover", "Backup", "Restore", "Set", "Purge",
    ]
}
