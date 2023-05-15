# Create AKS node pool for user workloads
resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = var.user_node_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.user_node_size
  node_count            = var.user_node_count
  os_disk_type          = var.user_os_disk_type
  enable_auto_scaling   = var.user_node_auto_scale
  min_count             = var.user_node_min_count
  max_count             = var.user_node_max_count
  tags                  = var.tags
  vnet_subnet_id        = azurerm_subnet.aks-default-subnet.id
}