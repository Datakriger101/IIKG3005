
module "ResourceGroup" {
  source   = "./ResourceGroup"
  rgname   = "${var.rgname}-${local.workspace_type}"
  location = var.location[0]
  tags     = local.tags_billing
}

module "Network" {
  source = "./Network"

  # Gjorde dette for å vise at man ikke trenge outputs hvis man 
  # har resourcegroup i root module. 
  rgname    = module.ResourceGroup.rg_name_output
  location  = var.location[0]
  base_name = var.base_name
  tags      = local.tags_network

}

module "VirtualMachine" {
  source     = "./VirtualMachine"
  rgname     = module.ResourceGroup.rg_name_output
  location   = var.location[0]
  base_name  = var.base_name
  subnet_id  = module.Network.subnet_id_output
  pip_output = module.Network.pip_output
  tags       = local.tags_vm
}

module "Webpage" {
  source         = "./Webpage"
  rgname         = module.ResourceGroup.rg_name_output
  location       = var.location[0]
  saac_name      = var.saac_name
  source_content = var.source_content
  index_document = var.index_document
  workspace_type = "${var.rgname}-${local.workspace_type}"
  tags           = local.tags_website
}