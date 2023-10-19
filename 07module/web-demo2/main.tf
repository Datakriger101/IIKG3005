
# Locals for the workspace
locals {
  workspace-suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name    = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspace-suffix}"
  sa_name    = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspace-suffix}"
  web_suffix = "<h1>${terraform.workspace}</h1><p>The Superman!</p>"
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Create Resource Group
resource "azurerm_resource_group" "rg_web" {
  name     = local.rg_name
  location = var.location
}

# Create Storage Account
resource "azurerm_storage_account" "sa_web" {
  name                     = "${var.sa_name}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web.name
  location                 = azurerm_resource_group.rg_web.location
  account_tier             = "Standard"
  account_replication_type = "GSR"
  min_tls_version          = "TLS1_2"


  static_website {
    index_document = var.index_document
  }
}


# Add a index.html file to the storage account
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "  ${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}

resource "local_file" "index_html" {
  filename = "index.html"
  content  = <<-EOT
    <!DOCTYPE html>
    <html>
    <head>
      <title>${var.source_content}</title>
    </head>
    <body>

      <h1>This is ${var.source_content}</h1>
      <p>yes superman is the shit!</p>

    </body>
    </html>
  EOT
}

