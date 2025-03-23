module "resourcegrp" {
source = "./modules/resourcegrp"
for_each = var.resource_group_name
resource_group_name = each.value.name
location            = var.location
}

module "vnetandsubnets" {
source = "./modules/vnetandsubnets"
name = var.name
location = module.resourcegrp["prod"].resource_group_location
resource_group_name = "vnetrg"
address_space       = var.address_space
}
