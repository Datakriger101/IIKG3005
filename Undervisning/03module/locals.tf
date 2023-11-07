# Viser bruk av locals
locals {
  tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  # Lager bare en ekstra fordi jeg kan. Denne bare ligger her uten å bli brukt
  common_tags = {
    company      = "${var.company}-v2"
    project      = "${var.company}-${var.project}-v2"
    billing_code = "${var.billing_code}-v2"
  }
}