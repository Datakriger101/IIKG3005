locals {
  common_tags = {
    owner       = "Eskil Refsaard"
    project     = "Module 04"
    environment = "Production"
    department  = "Infrastructure"
  }


  tags_billing = {
    owner       = "Eskil Refsaard"
    project     = "Module 04"
    environment = "Production"
    department  = "Economy"
  }


  tags_network = {
    owner       = "Eskil Refsaard"
    project     = "Module 04"
    environment = "Production"
    department  = "Economy"
  }

  tags_vm = {
    owner        = "Eskil Refsgaard"
    project      = "Module 04"
    environment  = "Production"
    department   = "Infrastructure"
    tags_billing = var.tags_billing
  }

}