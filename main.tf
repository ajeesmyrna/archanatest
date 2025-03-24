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

module "vm_prod" {
  source              = "./modules/virtualmachine"
  vm_name             = "archanaprod-vm"
  location            = module.resourcegrp["prod"].resource_group_location
  resource_group_name = module.resourcegrp["prod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["prod"]
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}

module "archanaprod-vm2" {
  source              = "./modules/virtualmachine"
  vm_name             = "archanaprod-vm2"
  location            = module.resourcegrp["prod"].resource_group_location
  resource_group_name = module.resourcegrp["prod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["prod"]
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}


/*module "vm_nonprod" {
  source              = "./modules/virtualmachine"
  vm_name             = "nonprod-vm"
  location            = module.resourcegrp["nonprod"].resource_group_location
  resource_group_name = module.resourcegrp["nonprod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["subnet2"].id
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}*/