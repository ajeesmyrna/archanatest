output "rglocation_out" {
    value = module.resourcegrp["prod"].resource_group_location
}

output "resourcegroup_prod_name_out" {
    value=module.resourcegrp["prod"].resource_group_name_prod
}

output "resourcegroup_nonprod_name_out" {
    value=module.resourcegrp["nonprod"].resource_group_name_nonprod
}

output "vnet_name_out" {
    value=module.vnetandsubnets["prodsubnet"].vnetname_out
}

output "vnet_address_space_out" {
    value=module.vnetandsubnets["prodsubnet"].addressspace_out
}

output "vnetrg_out" {
    value=module.vnetandsubnets["prodsubnet"].vnetrg_out
}

output "subnet_prod_name_out" {
    value=module.vnetandsubnets["prodsubnet"].subnet_name_prod_out
}

output "subnet_prod_address_space_out" {
    value=module.vnetandsubnets["prodsubnet"].subnet_address_space_prod_out
}

output "subnet_nonprod_name_out" {
    value=module.vnetandsubnets["nonprodsubnet"].subnet_name_nonprod_out
}

output "subnet_nonprod_address_space_out" {
    value=module.vnetandsubnets["nonprodsubnet"].subnet_address_space_nonprod_out
}