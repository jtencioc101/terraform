resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "aks-default-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name
  node_resource_group = var.node_resource_group


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

#todo --- add block to create Jumpbox VMs


#todo --- add block to peer the Jumpbox VNET to the AKS VNET