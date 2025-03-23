variable "resource_group_name" {
    description = "resoruce group for vnet"
    type        = string
}

variable "address_space" {
    description = "adress space for Vnet"
    type        = list(string)
}

variable "name" {
    description = "name for vnet"
    type        = string
}

variable "location" {
    description = "resoruce group location"
    type        = string
}

variable "subnet_name" {
    description = "resoruce group location"
    type        = string
}
variable "subnet_address_prefixes" {
    description = "adress space for Vnet"
    type        = list(string)
}
