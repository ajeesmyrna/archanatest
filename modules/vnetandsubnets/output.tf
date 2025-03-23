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