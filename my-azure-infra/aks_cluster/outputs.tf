output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.private_fqdn
}

output "jumpbox_public_ip" {
  value = azurerm_linux_virtual_machine.jumpbox.public_ip_address
}