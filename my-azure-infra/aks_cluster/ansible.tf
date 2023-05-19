resource "ansible_host" "aks_jumpbox" {
  depends_on = [azurerm_linux_virtual_machine.jumpbox]
  name       = azurerm_linux_virtual_machine.jumpbox.public_ip_address

}
resource "ansible_playbook" "playbook" {
  depends_on = [azurerm_kubernetes_cluster.aks]
  playbook   = "playbook.yml"
  name       = azurerm_linux_virtual_machine.jumpbox.public_ip_address
  replayable = true
}