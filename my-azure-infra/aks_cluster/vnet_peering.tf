# Create peering between AKS and Jumpbox VNets

resource "azurerm_virtual_network_peering" "jumpbox-to-aks" {
  name                      = var.peering1_name
  resource_group_name       = var.jumpbox_resource_group
  virtual_network_name      = azurerm_virtual_network.jumpbox.name
  remote_virtual_network_id = azurerm_virtual_network.aks-vnet.id
}

resource "azurerm_virtual_network_peering" "aks-to-jumpbox" {
  name                      = var.peering2_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.aks-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.jumpbox.id
}