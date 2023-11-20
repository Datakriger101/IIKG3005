resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Create Storage Account
resource "azurerm_storage_account" "sa_web" {
  name                     = "${var.saac_name}${random_string.random_string.result}"
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = var.index_document
  }

  tags = var.tags
}


# Add a index.html file to the storage account
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}<p>${upper(local.workspace_type)}</p>"


}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}