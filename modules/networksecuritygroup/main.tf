resource "azurerm_network_security_group" "ajeensg" {
          name                = var.nsgname
          location            = var.location
          resource_group_name = var.resource_group_name 
        
          security_rule {
            name                       = var.rulename
            priority                   = var.priority
            direction                  = "Inbound"
            access                     = var.access
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = 22
            source_address_prefix      = "*"
            destination_address_prefix = var.destination_address_prefix
          }
        }
        
resource "azurerm_subnet_network_security_group_association" "example" {
          subnet_id                 = var.subnet_id
          network_security_group_id = azurerm_network_security_group.ajeensg.id
        }


