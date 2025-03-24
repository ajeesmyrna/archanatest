variable "resource_group_name" {
  description = "Map of resource groups with their names and locations"
  type        = map(object({
    name = string
  }))
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "A map of subnets to create"
  type = map(object({
    name            = string
    address_prefixes = list(string)
  }))
}