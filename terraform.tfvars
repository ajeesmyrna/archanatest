resource_group_name = {
  nonprod-rg = {
    name = "nonprod-rg"
    location = "East US"
  }
  vnet-rg = {
    name = "vnet-rg"
    location = "East US"
  }
  test-rg = {
    name = "test-rg"
    location = "East US"
  }
}

location = "East US"

vnet_name = "vnet"

address_space = ["10.30.0.0/16"]

subnets = {
  nonproduction_subnet = {
    name            = "nonproduction_subnet"
    address_prefixes = ["10.30.10.0/24"]
  }
  test_subnet = {
    name            = "test_subnet"
    address_prefixes = ["10.30.20.0/24"]
  }
    new_subnet = {
    name            = "test_subnet"
    address_prefixes = ["10.30.30.0/24"]
  }
}

vm = {
  nonproduction_vm = {
    vm_name   = "nonproductionvm1"
    vm_size   = "Standard_B2s"
    subnet_id = "nonproduction_subnet" # Use the key, not the dynamic reference
    resource_group_name = "nonprod-rg"
  }
  test_vm = {
    vm_name      = "testvm1"
    vm_size   = "Standard_B1s"
    subnet_id = "test_subnet" # Use the key, not the dynamic reference
    resource_group_name = "test-rg"
  }
}
