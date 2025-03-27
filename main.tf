module "resourcegrp" {
  #source             = "./modules/resourcegrp"
  source              = "git::https://github.com/ajeesmyrna/archanatest.git//modules/resourcegrp?ref=main"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnetandsubnets" {
  #source              = "./modules/vnetandsubnets"
  source              = "git::https://github.com/ajeesmyrna/archanatest.git//modules/vnetandsubnets?ref=main"
  name                = var.vnet_name
  location            = module.resourcegrp.resource_group_location_out["vnet-rg"]
  resource_group_name = module.resourcegrp.resource_group_name_out["vnet-rg"]
  address_space       = var.address_space
  subnets             = var.subnets
}

module "virtualmachine" {
  for_each            = var.vm
  #source              = "./modules/virtualmachine"
  source             = "git::https://github.com/ajeesmyrna/archanatest.git//modules/virtualmachine?ref=main"
  vm_name             = each.value.vm_name
  location            = module.resourcegrp.resource_group_location_out["vnet-rg"]
  resource_group_name = module.resourcegrp.resource_group_name_out[each.value.resource_group_name]
  subnet_id           = module.vnetandsubnets.subnets_out[each.value.subnet_id]
  vm_size             = each.value.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  create_public_ip    = var.create_public_ip
}