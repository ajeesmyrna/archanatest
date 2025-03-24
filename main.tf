module "resourcegrp" {
  source              = "./modules/resourcegrp"
  for_each            = var.resource_group_name
  resource_group_name = each.value.name
  location            = var.location
}

module "vnetandsubnets" {
  source              = "./modules/vnetandsubnets"
  name                = var.vnet_name
  location            = module.resourcegrp["vnet"].resource_group_location
  resource_group_name = module.resourcegrp["vnet"].resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets
}