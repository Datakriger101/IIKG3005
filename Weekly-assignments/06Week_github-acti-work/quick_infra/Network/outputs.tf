
output "subnet_id_output" {
  value = azurerm_subnet.ez-subnet[0].id
}

# For den ene linux maskinen
output "pip_output" {
  value = azurerm_public_ip.ez-pip-mod06.id

}


# Testing for console

output "subnet_address_prefixes0" {
  value = azurerm_subnet.ez-subnet[0].address_prefixes
}

output "subnet_address_prefixes1" {
  value = azurerm_subnet.ez-subnet[1].address_prefixes
}


output "pip_mod06_output" {
  value = azurerm_public_ip.ez-pip-mod06.name
}