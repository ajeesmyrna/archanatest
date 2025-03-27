# Creating resource groups

resource "azurerm_resource_group" "rg" {
  location = var.location
  for_each = var.resource_group_name
  name     = each.value.name
}