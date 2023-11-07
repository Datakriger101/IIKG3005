# Viser bruk av locals
locals {
  tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  # Jeg tar nå denne i bruk for å vise at den fungerer
  tags_generic = {
    company      = "${var.company}-v2"
    project      = "${var.company}-${var.project}-v2"
    billing_code = "${var.billing_code}-v2"
  }
}

# Virtual Network
locals {
  vnet-internal = {
    company = var.company
    project = "${var.company}-${var.project}"
    network = "internal"
  }

  vnet-external = {
    company = var.company
    project = "${var.company}-${var.project}"
    network = "external"
  }
}
