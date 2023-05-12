# Global variables
resource_group_name     = "aks_terraform_rg"
location                = "East US"
cluster_name            = "devakscluster"
kubernetes_version      = "1.25.5"
node_resource_group     = "aks_terraform_resources_rg"
private_cluster_enabled = true
network_plugin          = "kubenet"
tags = {
  environment = "Production"
  owner       = "Julio"
  project     = "my-aks-infra"
}

# System node variables
system_node_count   = 1
system_node_vm_size = "Standard_DS2_v2"
system_node_name    = "systempool"
system_node_type    = "VirtualMachineScaleSets"
enable_auto_scaling = false
identity_type       = "SystemAssigned"

# User node variables
user_node_name       = "node01"
user_node_size       = "Standard_DS3_v2"
user_node_count      = 1
user_os_disk_type    = "Ephemeral"
user_node_auto_scale = true
user_node_min_count  = 1
user_node_max_count  = 3 