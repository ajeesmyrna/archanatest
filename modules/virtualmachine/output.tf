output "vm_id_out" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.archanavm.id
}

output "vm_name_out" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.archanavm.name
}

output "vm_private_ip_out" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.vm_nic.ip_configuration[0].private_ip_address
}


output "vm_public_ip_out" {
  description = "The public IP address of the virtual machine"
  value       = var.create_public_ip && length(azurerm_public_ip.vm_public_ip) > 0 ? azurerm_public_ip.vm_public_ip[0].ip_address : null
}

