resource "ansible_host" "nginx-vm" {
  depends_on = [azurerm_linux_virtual_machine.linux-vm]
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  groups     = ["webservers"]
}
resource "ansible_playbook" "playbook" {
  playbook   = "playbook.yml"
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  replayable = true
}