resource_group_name = {
  prod = {
    name = "prod-rg"
  }
  nonprod = {
    name = "nonprod-rg"
  }
  vnet = {
    name = "vnet-rg"
  }
}

location = "East US"

vnet_name = "archanaprod-vnet"

address_space = ["10.30.0.0/16"]

subnets = {
  prod = {
    name            = "prod"
    address_prefixes = ["10.30.10.0/24"]
  }
  nonprod = {
    name            = "nonprod"
    address_prefixes = ["10.30.20.0/24"]
  }
  test = {
    name            = "test"
    address_prefixes = ["10.30.30.0/24"]
  }
}