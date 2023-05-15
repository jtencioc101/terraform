resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name



  default_node_pool {
    name                = var.system_node_name
    node_count          = var.system_node_count
    vm_size             = var.system_node_vm_size
    type                = var.system_node_type
    enable_auto_scaling = var.enable_auto_scaling
    tags                = var.tags
    vnet_subnet_id      = azurerm_subnet.aks-default-subnet.id
  }
  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin = var.network_plugin
  }
  private_cluster_enabled = var.private_cluster_enabled

}