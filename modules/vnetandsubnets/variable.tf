variable "name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The location of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
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
