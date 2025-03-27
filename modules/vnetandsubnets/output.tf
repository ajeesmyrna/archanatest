# Output the name of the virtual network
output "vnet_name_out" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

# Output the address space of the virtual network
output "vnet_address_space_out" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.vnet.address_space
}

# Output the resource group name for the virtual network
output "resource_group_name_out" {
  description = "The resource group name for the virtual network"
  value       = azurerm_virtual_network.vnet.resource_group_name
}

output "vnet_id_out" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

# Output the names of the subnets
output "subnet_names_out" {
  description = "The names of the subnets"
  value = [
    for subnet in azurerm_subnet.subnets : subnet.name
  ]
}

#Output the address prefixes of the subnets
output "subnet_address_prefixes_out" {
  description = "The address prefixes of the subnets"
  value = [
    for subnet in azurerm_subnet.subnets : subnet.address_prefixes
  ]
}

output "subnets_out" {
  description = "A map of subnet IDs"
  value = {
    for key, subnet in azurerm_subnet.subnets :
    key => subnet.id
  }
}