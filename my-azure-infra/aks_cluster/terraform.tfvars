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

# Network variables
vnet_name        = "aks_vnet"
address_space    = ["10.0.0.0/8"]
subnet_name      = "aks_default_subnet"
address_prefixes = ["10.240.0.0/16"]


# Jumpbox variables
jumpbox_location         = "East US"
jumpbox_resource_group   = "jumpbox_rg"
jumpbox_vnet_name        = "jumpbox_vnet"
jumpbox_address_space    = ["192.168.0.0/24"]
jumpbox_address_prefixes = ["192.168.0.0/28"]
public_ip_name           = "jumpbox_public_ip"
ip_allocation_method     = "Dynamic"
nic_name                 = "jumpbox_nic"
ipconfig_name            = "jumpbox_ipconfig"
private_ip_allocation    = "Dynamic"

# NSG variables
nsg_name = "jumpbox_nsg"
# NSG rules variables
nsg_rule_name                       = "jumpbox_nsg_rule"
nsg_rule_priority                   = 100
nsg_rule_direction                  = "Inbound"
nsg_rule_access                     = "Allow"
nsg_rule_protocol                   = "*"
nsg_rule_source_port_range          = "*"
nsg_rule_destination_port_range     = "*"
nsg_rule_source_address_prefix      = "$PUBIP"
nsg_rule_destination_address_prefix = "*"

# Storage account variables
sa_account_tier             = "Standard"
sa_account_replication_type = "LRS"

# Virtual machine variables
vm_name                 = "jumpbox"
vm_size                 = "Standard_B1s"
os_disk_name            = "jumpbox_os_disk"
os_disk_caching         = "ReadWrite"
os_storage_account_type = "Standard_LRS"
publisher               = "Canonical"
offer                   = "UbuntuServer"
sku                     = "18.04-LTS"
os_version              = "latest"
computer_name           = "jumpbox"
admin_username          = "k8sadmin"
disable_password_auth   = true


# Network peering variables
peering1_name = "jumpbox_to_aks"
peering2_name = "aks_to_jumpbox"



