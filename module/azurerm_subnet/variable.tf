variable "subnet_name" {
  description = "The name of the subnet"
  type        = string

}
variable "resource_group_name" {
  description = "the vnet rg name"
  type        = string

}
variable "virtual_network_name" {
  description = "the vnet name of the subnet"
  type        = string

}
variable "address_prefixes" {
  description = "The address of subnet ip"
  type        = list

}
