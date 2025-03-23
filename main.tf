module "resourcegrp" {
source = "./modules/resourcegrp"
for_each = var.resource_group_name
resource_group_name = each.value.name
location            = var.location
}
