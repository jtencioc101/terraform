resource "ansible_host" "nginx-vm" {
  depends_on = [azurerm_linux_virtual_machine.linux-vm]
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  groups     = ["webservers"]
  variables = {
    ansible_user               = var.admin_username
    ansible_ssh_private_key    = "~/.ssh/id_rsa"
    ansible_python_interpreter = "/usr/bin/python3"
  }
}
resource "ansible_playbook" "nginx" {
  playbook   = "playbook.yml"
  name       = azurerm_linux_virtual_machine.linux-vm.public_ip_address
  replayable = true
}