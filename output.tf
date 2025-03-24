# Outputs from the resourcegrp module
output "resource_group_name_prod" {
  description = "The name of the prod resource group"
  value       = module.resourcegrp["prod"].resource_group_name
}

output "resource_group_location_prod" {
  description = "The location of the prod resource group"
  value       = module.resourcegrp["prod"].resource_group_location
}

output "resource_group_name_nonprod" {
  description = "The name of the nonprod resource group"
  value       = module.resourcegrp["nonprod"].resource_group_name
}

output "resource_group_location_nonprod" {
  description = "The location of the nonprod resource group"
  value       = module.resourcegrp["nonprod"].resource_group_location
}

output "resource_group_name_vnet" {
  description = "The name of the nonprod resource group"
  value       = module.resourcegrp["vnet"].resource_group_name
}

output "resource_group_location_vnet" {
  description = "The location of the nonprod resource group"
  value       = module.resourcegrp["nonprod"].resource_group_location
}
# Outputs from the vnetandsubnets module
output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.vnetandsubnets.vnet_name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = module.vnetandsubnets.vnet_address_space
}

output "vnet_resource_group" {
  description = "The resource group name for the virtual network"
  value       = module.vnetandsubnets.resource_group_name
}

output "subnet_names" {
  description = "The names of the subnets"
  value       = module.vnetandsubnets.subnet_names
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnets"
  value       = module.vnetandsubnets.subnet_address_prefixes
}

output "subnet_id" {
  description = "The address prefixes of the subnets"
  value       = module.vnetandsubnets.subnets
}

# Outputs from the virtualmachine module for prod
output "prod_vm_id" {
  description = "The ID of the prod virtual machine"
  value       = module.vm_prod.vm_id
}

output "prod_vm_name" {
  description = "The name of the prod virtual machine"
  value       = module.vm_prod.vm_name
}

output "prod_vm_private_ip" {
  description = "The private IP address of the prod virtual machine"
  value       = module.vm_prod.vm_private_ip
}