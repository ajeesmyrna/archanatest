output "vnetname_out" {
  description = "The location of the resource group"
  value       = azurerm_virtual_network.archanaprod-vnet.name
}

output "addressspace_out" {
  description = "The location of the resource group"
  value       = azurerm_virtual_network.archanaprod-vnet.address_space
}

output "vnetrg_out" {
  description = "The location of the resource group"
  value       = azurerm_virtual_network.archanaprod-vnet.resource_group_name
}

output "subnet_name_prod_out" {
  description = "The location of the resource group"
  value       = azurerm_subnet.subnets.name
}

output "subnet_address_space_prod_out" {
  description = "The location of the resource group"
  value       = azurerm_subnet.subnets.address_prefixes
}

output "subnet_name_nonprod_out" {
  description = "The location of the resource group"
  value       = azurerm_subnet.subnets.name
}

output "subnet_address_space_nonprod_out" {
  description = "The location of the resource group"
  value       = azurerm_subnet.subnets.address_prefixes
}