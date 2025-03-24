output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.prodvm.id
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.prodvm.name
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.vm_nic.ip_configuration[0].private_ip_address
}