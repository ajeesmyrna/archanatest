output "rglocation_out" {
    value = module.resourcegrp["prod"].resource_group_location
}

output "rglocation_prod_name_out" {
    value=module.resourcegrp["prod"].resource_group_name_prod
}


output "rglocation_nonprod_name_out" {
    value=module.resourcegrp["nonprod"].resource_group_name_nonprod
}

output "vnet_name_out" {
    value=module.vnetandsubnets.vnetname_out
}

output "address_space_out" {
    value=module.vnetandsubnets.addressspace_out
}

output "vnetrg_out" {
    value=module.vnetandsubnets.vnetrg_out
}