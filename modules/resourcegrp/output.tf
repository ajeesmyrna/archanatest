
output "resource_group_name_out" {
  description = "The names of the resource groups"
  value = {
    for key, rg in azurerm_resource_group.rg :
    key => rg.name
  }
}

output "resource_group_location_out" {
  description = "The locations of the resource groups"
  value = {
    for key, rg in azurerm_resource_group.rg :
    key => rg.location
  }
}