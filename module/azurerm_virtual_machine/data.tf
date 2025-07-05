data "azurerm_subnet" "subnets" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
data "azurerm_public_ip" "pip_ips" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}
