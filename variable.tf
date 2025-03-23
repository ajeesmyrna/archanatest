variable "location" {
    description = "resoruce group location"
    type        = string
}

variable "resource_group_name" {
  description = "Map of resource groups with their names and locations"
  type        = map(object({
    name     = string
  }))
}

variable "address_space" {
    description = "adress space for Vnet"
    type        = list(string)
}

variable "name" {
    description = "name of the vnet"
    type        = string
}

