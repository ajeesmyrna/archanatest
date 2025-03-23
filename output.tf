output "rglocation_out" {
    value = module.resourcegrp["prod"].resource_group_location
}

output "rglocation_prod_name_out" {
    value=module.resourcegrp["prod"].resource_group_name_prod
}


output "rglocation_nonprod_name_out" {
    value=module.resourcegrp["nonprod"].resource_group_name_nonprod
}