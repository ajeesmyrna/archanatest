terraform {
  backend "azurerm" {
    resource_group_name  = "terraformrgmarch2025"
    storage_account_name = "terraformstgmarch2025"
    container_name       = "tfstate"
    key                  = "archanaprodmap.tfstate"
  }
}