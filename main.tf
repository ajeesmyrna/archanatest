module "prodinframodule" {
source = "./modules/prodinfra"
for_each = var.resource_group_name
resource_group_name = each.value.name
location            = var.location
}
