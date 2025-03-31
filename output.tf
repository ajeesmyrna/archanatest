# Outputs from the resourcegrp module
output "resource_group_name" {
  description = "The name of the prod resource group"
  value       = module.resourcegrp.resource_group_name_out
}

output "resource_group_location" {
  description = "The location of the prod resource group"
  value       = module.resourcegrp.resource_group_location_out
}

# Outputs from the vnetandsubnets module
output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.vnetandsubnets.vnet_name_out
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = module.vnetandsubnets.vnet_address_space_out
}

output "vnet_resource_id" {
  description = "The resource group name for the virtual network"
  value       = module.vnetandsubnets.vnet_id_out
}

output "vnet_resource_group" {
  description = "The resource group name for the virtual network"
  value       = module.vnetandsubnets.resource_group_name_out
}

output "subnet_names" {
  description = "The names of the subnets"
  value       = module.vnetandsubnets.subnet_names_out
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnets"
  value       = module.vnetandsubnets.subnet_address_prefixes_out
}

output "subnet_id" {
  description = "The address prefixes of the subnets"
  value       = module.vnetandsubnets.subnets_out
}

output "vm_names" {
  description = "The names of the virtual machines"
  value = {
    for key, vm in module.virtualmachine :
    key => vm.vm_name_out
  }
}

output "vm_ids" {
  description = "The IDs of the virtual machines"
  value = {
    for key, vm in module.virtualmachine :
    key => vm.vm_id_out
  }
}

output "vm_private_ips" {
  description = "The private IP addresses of the virtual machines"
  value = {
    for key, vm in module.virtualmachine :
    key => vm.vm_private_ip_out
  }
}

output "vm_public_ips" {
  description = "The public IP addresses of the virtual machines"
  value = {
    for key, vm in module.virtualmachine :
    key => vm.vm_public_ip_out
  }
}
