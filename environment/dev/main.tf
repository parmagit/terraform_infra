module "azurerm_resource_group" {
  source              = "../../module/azurerm_resource_group"
  resource_group_name = "radhe-rg"
  location            = "westus"

}
module "azurerm_resource_group1" {
  source              = "../../module/azurerm_resource_group"
  resource_group_name = "radhe-rani-rg"
  location            = "westus"

}

module "azurerm_virtual_network" {
  depends_on    = [module.azurerm_resource_group]
  source        = "../../module/azurerm_virtaul_network"
  vnet_name     = "radhe-vnet"
  vnet_location = "westus"
  resource_name = "radhe-rg"
  address_space = ["10.0.0.0/16"]

}
module "azurerm_fontend-subnet" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../../module/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  resource_group_name  = "radhe-rg"
  virtual_network_name = "radhe-vnet"
  address_prefixes     = ["10.0.1.0/24"]

}
module "azurerm_backend_subnet" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../../module/azurerm_subnet"
  subnet_name          = "backend-subnet"
  resource_group_name  = "radhe-rg"
  virtual_network_name = "radhe-vnet"
  address_prefixes     = ["10.0.2.0/24"]

}
module "frontend_public_ip" {
  source              = "../../module/azurerm_pip"
  depends_on          = [module.azurerm_resource_group]
  pip_name            = "radhe-pip"
  resource_group_name = "radhe-rg"
  location            = "westus"
  allocation_method   = "Static"

}
# module "backend_public_ip" {
#   source              = "../../module/azurerm_pip"
#   depends_on          = [module.azurerm_resource_group]
#   pip_name            = "backend-pip"
#   resource_group_name = "todo-rg"
#   location            = "westus"
#   allocation_method   = "Static"

# }
module "azurerm_frontend_vm" {
  source               = "../../module/azurerm_virtual_machine"
  depends_on           = [module.azurerm_backend_subnet]
  subnet_name          = "frontend-subnet"
  virtual_network_name = "radhe-vnet"
  pip_name             = "radhe-pip"
  resource_group_name  = "radhe-rg"
  nic_name             = "frontend-nic"
  location             = "westus"
  size                 = "Standard_F2"
  admin_username       = "Paramvm"
  admin_password       = "Nokia@12345"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_sku            = "22_04-lts"
  image_version        = "latest"
  frontend_vm          = "Frontendvm-pc"

}
module "sql_server" {
  source              = "../../module/azurerm_sql_server"
  depends_on          = [module.azurerm_resource_group]
  sql_server_name     = "pcserver123"
  resource_group_name = "radhe-rg"
  location            = "westus"
  sql_version         = "12.0"
  sql_username        = "Anshsql"
  sql_password        = "Nokia@12345"

}
module "sql_databse" {
  depends_on          = [module.sql_server]
  source              = "../../module/azurerm_sql_databse"
  sqldatabse          = "anshdata-base"
  sql_server_name     = "pcserver123"
  resource_group_name = "radhe-rg"

}
module "kv_module" {
  source              = "../../module/azurerm_key_vault"
  depends_on          = [module.azurerm_resource_group]
  name                = "pckeyvault6694"
  location            = "westus"
  resource_group_name = "radhe-rg"
}
