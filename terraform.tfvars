resource_group_name = {
  prod = {
    name     = "archanaprod-rg"
  }
  nonprod = {
    name     = "archananonprod-rg"
  }
}

location = "East US"
address_space = ["10.10.0.0/16"]
name      = "archanavnet"

subnets = {
  prodsubnet = {
    name     = "archanaprod-subnet"
    address_prefixes = ["10.10.10.0/24"]
  }
  nonprodsubnet = {
    name     = "archananonprod-subnet"
    address_prefixes = ["10.10.20.0/24"]
  }
}
