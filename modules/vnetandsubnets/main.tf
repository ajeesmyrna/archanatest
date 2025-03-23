# Create a resource group
resource "azurerm_resource_group" "vnet-rg" {
  name     = "${var.resource_group_name}RG"
  location = var.location
}

resource "azurerm_virtual_network" "archanaprod-vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = "${var.resource_group_name}RG"
  address_space       = var.address_space
 # Ensure this depends on the resource group
  depends_on = [
    azurerm_resource_group.vnet-rg
  ]

}

resource "azurerm_subnet" "subnets" {
  resource_group_name  = "${var.resource_group_name}RG"
  virtual_network_name = azurerm_virtual_network.archanaprod-vnet.name
  name                 = var.subnet_name
  address_prefixes     = var.subnet_address_prefixes

  # Ensure this depends on the resource group
  depends_on = [
    azurerm_resource_group.vnet-rg,
    azurerm_virtual_network.archanaprod-vnet
  ]
  }
