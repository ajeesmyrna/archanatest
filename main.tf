module "resourcegrp" {
source = "./modules/resourcegrp"
for_each = var.resource_group_name
resource_group_name = each.value.name
location            = var.location
}

/*
output "resource_group_name_from_module" {
  description = "The name of the resource group from the resourcegrp module"
  value       = module.resourcegrp.resource_group_name
}

output "resource_group_location_from_module" {
  description = "The location of the resource group from the resourcegrp module"
  value       = module.resourcegrp.resource_group_location
}*/