output "key_vault_id" {
  value       = azurerm_key_vault.key_vault.id
  description = "The ID of the Key Vault"
}

output "key_access_policy" {
  value =  azurerm_key_vault_access_policy.access_policy
}
