# Lager ikke ny config da jeg allerede har laget denne og finpusset den en del
# Denne er nok fin å bruke ved videre arbeid mot eksamen.

locals {
  workspace-suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspace-suffix}"
  sa_name = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspace-suffix}"
  web_suffix = "<h1>${terraform.workspace}</h1>"
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Create Resource Group
resource "azurerm_resource_group" "rg_web_ez" {
  name     = local.rg_name
  location = var.rg_location
}

# Create Storage Account
resource "azurerm_storage_account" "sa_web" {
  name                     = "${lower(local.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web_ez.name
  location                 = azurerm_resource_group.rg_web_ez.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = var.index_document
  }
}

# Add a index.html file to the storage account a
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1>${var.source_content}${local.web_suffix}</h1><p>${var.more_source_content}</p>"
  # Vet ikke hvorfor, men workspace suffix havner på linjen under...
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}

#destroy awdawd