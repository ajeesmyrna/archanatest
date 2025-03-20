# Create a resource group
resource "azurerm_resource_group" "archanaprod" {
  name     = "${var.resource_group_name}RG"
  location = var.location
}

lifecycle {
    prevent_destroy = true
}
