output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "storage_container_id" {
  value = azurerm_storage_container.storage_container.id
}

output "connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}
