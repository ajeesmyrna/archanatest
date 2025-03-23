output "resource_group_name_prod" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.archanaprod-rg.name
}

output "resource_group_name_nonprod" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.archanaprod-rg.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.archanaprod-rg.location
}

