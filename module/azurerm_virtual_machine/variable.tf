variable "subnet_name" {
  description = "name of the subnet"
  type = string
  
}
variable "virtual_network_name" {
  description = "name of the subnet"
  type = string
  
}
variable "pip_name" {
  description = "name of the pip"
  type = string
  
}
variable "resource_group_name" {
  
description = "name of the rg"
type = string
}
variable "nic_name" {
  description = "name of the nic"
  type = string
  
}
variable "location" {
  description = "name of the nic location"
  type=string
  
}
variable "frontend_vm" {
  description = "name of frontend vm"
  type = string
  
}
variable "size" {
  description = "size of vm"
type = string  
}
variable "admin_username" {
  description = "vm usename"
  type = string
  
}
variable "admin_password" {
  description = "vm password"
  type=string  
}
variable "image_publisher" {
  description = "vm image publisher"
  type = string
  
}
variable "image_offer" {
  description = "iamge offer name"
  type = string
  
}
variable "image_sku" {
  description = "name of vm sku"
  type = string
  
}
variable "image_version" {
  description = "name of the vm version"
  
}