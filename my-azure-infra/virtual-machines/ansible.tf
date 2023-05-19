resource "ansible_group" "webservers" {
  name = "webservers"
}
resource "ansible_host" "nginx-vm" {
  depends_on = [azurerm_linux_virtual_machine.linux-vm]
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  groups     = [ansible_group.webservers.name]
}
resource "ansible_playbook" "playbook" {
  depends_on = [azurerm_linux_virtual_machine.linux-vm]
  playbook   = "playbook.yml"
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  replayable = true
}