# Create a resource group
resource "azurerm_resource_group" "archanaprod-rg" {
  name     = var.resource_group_name
  location = var.location
}