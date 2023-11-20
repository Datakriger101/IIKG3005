locals {
  workspace_type = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}


locals {
  common_tags = {
    owner       = var.owner_name
    project     = var.project_name
    department  = var.department_inf
    environment = local.workspace_type
  }


  tags_billing = {
    owner        = var.owner_name
    project      = var.project_name
    department   = var.department_economy
    billing_code = var.billing_code
    environment  = local.workspace_type
  }


  tags_network = {
    owner       = var.owner_name
    project     = var.project_name
    department  = var.department_inf
    environment = local.workspace_type
  }

  tags_vm = {
    owner       = var.owner_name
    project     = var.project_name
    department  = var.department_inf
    environment = local.workspace_type
  }

  tags_website = {
    owner       = var.owner_name
    project     = var.project_name
    department  = var.department_inf
    environment = local.workspace_type
  }

}

