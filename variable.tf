variable "resource_group_name" {
  description = "Map of resource groups name and location"
  type        = map(object({
    name     = string
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

variable "vm" {
  description = "A map of subnets to create"
  type = map(object({
    vm_name            = string
    subnet_id          = string
    resource_group_name = string
    vm_size            = string
  }))
}

variable "create_public_ip" {
  description = "Whether to create a public IP for the virtual machine"
  type        = bool
  default     = false
}

variable "admin_username" {
  description = "The admin username for the VMs"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the VMs"
  type        = string
  default     = "P@ssw0rd123!"
}