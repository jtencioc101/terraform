resource "ansible_group" "webservers" {
  name = "webservers"
}
resource "ansible_host" "nginx-vm" {
  depends_on = [azurerm_linux_virtual_machine.linux-vm]
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  groups     = [ansible_group.webservers.name]
  variables = {
    ansible_user               = var.admin_username
    ansible_ssh_private_key    = "~/.ssh/id_rsa"
    ansible_python_interpreter = "/usr/bin/python3"
  }
}
resource "ansible_playbook" "playbook" {
  playbook                = "playbook.yml"
  ansible_playbook_binary = "/opt/homebrew/bin/ansible-playbook"
  name                    = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  replayable              = true
}