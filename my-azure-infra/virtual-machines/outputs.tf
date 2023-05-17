output "linux-vm_public_ip" {
  value = azurerm_linux_virtual_machine.linux-vm.public_ip_address
}
