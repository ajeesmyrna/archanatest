
variable "location" {
    description = "resource group location"
    type = string
}

variable "resource_group_name" {
  description = "A map of resource group to create"
  type = map(object({
    name            = string
  }))
}