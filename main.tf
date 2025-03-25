module "resourcegrp" {
  #source             = "./modules/resourcegrp"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/resourcegrp?ref=mainmarch24"
  for_each            = var.resource_group_name
  resource_group_name = each.value.name
  location            = var.location
}

module "vnetandsubnets" {
  #source              = "./modules/vnetandsubnets"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/vnetandsubnets?ref=mainmarch24"
  name                = var.vnet_name
  location            = module.resourcegrp["vnet"].resource_group_location
  resource_group_name = module.resourcegrp["vnet"].resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets
}

module "archanaprod-vm1" {
  #source              = "./modules/virtualmachine"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/virtualmachine?ref=mainmarch24"
  vm_name             = "archanaprod-vm1"
  location            = module.resourcegrp["prod"].resource_group_location
  resource_group_name = module.resourcegrp["prod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["prod"]
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}

/*
module "archanaprod-vm2" {
  #source              = "./modules/virtualmachine"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/virtualmachine?ref=mainmarch24"
  vm_name             = "archanaprod-vm2"
  location            = module.resourcegrp["prod"].resource_group_location
  resource_group_name = module.resourcegrp["prod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["prod"]
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}
*/

module "archananonprod-vm1" {
  #source              = "./modules/virtualmachine"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/virtualmachine?ref=mainmarch24"
  vm_name             = "archananonprod-vm1"
  location            = module.resourcegrp["nonprod"].resource_group_location
  resource_group_name = module.resourcegrp["nonprod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["nonprod"]
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}