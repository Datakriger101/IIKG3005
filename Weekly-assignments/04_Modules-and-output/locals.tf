locals {
  common_tags = {
    owner       = "Eskil Refsaard"
    project     = "Module 04"
    environment = "Production"
    department  = "Infrastructure"

  }

  tags_nsg = {
    owner       = "Eskil Refsaard"
    project     = "Module 04"
    environment = "Production"
    department  = "Infrastructure"
    department  = "Security"
  }

  tags_billing = {
    owner       = "Eskil Refsaard"
    project     = "Module 04"
    environment = "Production"
    department  = "Economy"
  }
}