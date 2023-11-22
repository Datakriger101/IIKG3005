locals {
  workspace_type = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}
