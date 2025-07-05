resource "azurerm_virtual_network" "vnetname" {
  name                = var.vnet_name
  location            = var.vnet_location
  address_space       = var.address_space
  resource_group_name = var.resource_name

}
