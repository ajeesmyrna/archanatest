module "resourcegrp" {
  #source             = "./modules/resourcegrp"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/resourcegrp?ref=main"
  for_each            = var.resource_group_name
  resource_group_name = each.value.name
  location            = var.location
}

module "vnetandsubnets" {
  #source              = "./modules/vnetandsubnets"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/vnetandsubnets?ref=main"
  name                = var.vnet_name
  location            = module.resourcegrp["nonprod"].resource_group_location
  resource_group_name = module.resourcegrp["nonprod"].resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets
}

module "archananonprod-vm1" {
  #source              = "./modules/virtualmachine"
  source              = "git::https://github.com/ajeesmyrna/archanaprod.git//modules/virtualmachine?ref=main"
  vm_name             = "archananonprod-vm1"
  location            = module.resourcegrp["nonprod"].resource_group_location
  resource_group_name = module.resourcegrp["nonprod"].resource_group_name
  subnet_id           = module.vnetandsubnets.subnets["nonprod"]
  vm_size             = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = false
}
