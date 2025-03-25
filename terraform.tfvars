resource_group_name = {
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
  nonprod = {
    name            = "nonprod"
    address_prefixes = ["10.30.20.0/24"]
  }
  test = {
    name            = "test"
    address_prefixes = ["10.30.30.0/24"]
  }
}