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
variable "vm_name" {
  description = "The admin username for the VMs"
  type        = string
  default     = "archanaprod-vm"
}

variable "vm_size" {
  description = "The admin username for the VMs"
  type        = string
  default     = "Standard_B2s"
}

variable "create_public_ip" {
  description = "Whether to create a public IP for the virtual machine"
  type        = bool
  default     = false
}