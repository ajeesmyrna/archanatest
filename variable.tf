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
  description = "A map of vm to create"
  type = map(object({
    vm_name            = string
    subnet_id          = string
    resource_group_name = string
    vm_size            = string
    create_public_ip   = bool
  }))
}

variable "key_vault_id" {
  description = "The Resource ID of the Azure Key Vault"
  type        = string
}

#variables for Network security group

variable "nsgname" {
  description = "The Resource ID of the Azure Key Vault"
  type        = string
}

variable "rulename" {
  description = "The Resource ID of the Azure Key Vault"
  type        = string
}

variable "priority" {
  description = "The Resource ID of the Azure Key Vault"
  type        = number
}

variable "access" {
  description = "The Resource ID of the Azure Key Vault"
  type        = string
}

variable "address_prefixes" {
  description = "The Resource ID of the Azure Key Vault"
  type        = string
}


