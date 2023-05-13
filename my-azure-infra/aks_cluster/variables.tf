variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "node_resource_group" {
  type        = string
  description = "RG name for cluster resources in Azure"
}

variable "system_node_name" {
  type        = string
  description = "Name of the system node pool"
}

variable "system_node_type" {
  type        = string
  description = "Type of the system node pool"
}

variable "system_node_vm_size" {
  type        = string
  description = "Size of the system node pool"
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable auto scaling for the system node pool"
}

variable "identity_type" {
  type        = string
  description = "Type of the identity"
}

variable "private_cluster_enabled" {
  type        = bool
  description = "Enable private cluster"
}

variable "network_plugin" {
  type        = string
  description = "Network plugin"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}

variable "user_node_name" {
  type        = string
  description = "Name of the user node pool"
}

variable "user_node_size" {
  type        = string
  description = "Size of the user node pool"
}

variable "user_node_count" {
  type        = number
  description = "Number of the user node pool"
}

variable "user_os_disk_type" {
  type        = string
  description = "OS disk type of the user node pool"
}

variable "user_node_auto_scale" {
  type        = bool
  description = "Enable auto scaling for the user node pool"
}

variable "user_node_min_count" {
  type        = number
  description = "Minimum number of the user node pool"
}

variable "user_node_max_count" {
  type        = number
  description = "Maximum number of the user node pool"
}

variable "vnet_name" {
  type        = string
  description = "Name of the VNET"
}

variable "address_space" {
  type        = list(string)
  description = "Address space of the VNET"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefixes of the subnet"
}

variable "jumpbox_location" {
  type        = string
  description = "Location of the jumpbox"
}

variable "jumpbox_resource_group" {
  type        = string
  description = "RG name of the jumpbox"
}

variable "jumpbox_vnet_name" {
  type        = string
  description = "Name of the jumpbox VNET"
}

variable "jumpbox_address_space" {
  type        = list(string)
  description = "Address space of the jumpbox VNET"
}

variable "jumpbox_address_prefixes" {
  type        = list(string)
  description = "Address prefixes of the jumpbox subnet"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public IP"
}

variable "ip_allocation_method" {
  type        = string
  description = "IP allocation method"
}

variable "nic_name" {
  type        = string
  description = "Name of the NIC"
}

variable "ipconfig_name" {
  type        = string
  description = "Name of the IP config"
}

variable "private_ip_allocation" {
  type        = string
  description = "Private IP allocation"
}

variable "nsg_name" {
  type        = string
  description = "Name of the NSG"
}

variable "nsg_rule_name" {
  type        = string
  description = "Name of the NSG rule"
}

variable "nsg_rule_priority" {
  type        = number
  description = "Priority of the NSG rule"
}

variable "nsg_rule_direction" {
  type        = string
  description = "Direction of the NSG rule"
}

variable "nsg_rule_access" {
  type        = string
  description = "Access of the NSG rule"
}

variable "nsg_rule_protocol" {
  type        = string
  description = "Protocol of the NSG rule"
}

variable "nsg_rule_source_port_range" {
  type        = string
  description = "Source port range of the NSG rule"
}

variable "nsg_rule_destination_port_range" {
  type        = string
  description = "Destination port range of the NSG rule"
}

variable "nsg_rule_source_address_prefix" {
  type        = string
  description = "Source address prefix of the NSG rule"
}

variable "nsg_rule_destination_address_prefix" {
  type        = string
  description = "Destination address prefix of the NSG rule"
}

variable "sa_account_tier" {
  type        = string
  description = "Tier of the storage account"
}

variable "sa_account_replication_type" {
  type        = string
  description = "Replication type of the storage account"
}

variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "vm_size" {
  type        = string
  description = "Size of the VM"
}

variable "os_disk_name" {
  type        = string
  description = "Name of the OS disk"
}

variable "os_disk_caching" {
  type        = string
  description = "Caching of the OS disk"
}

variable "os_storage_account_type" {
  type        = string
  description = "Storage account type of the OS disk"
}

variable "publisher" {
  type        = string
  description = "Publisher of the image"
}

variable "offer" {
  type        = string
  description = "Offer of the image"
}

variable "sku" {
  type        = string
  description = "SKU of the image"
}

variable "os_version" {
  type        = string
  description = "Version of the image"
}

variable "computer_name" {
  type        = string
  description = "Computer name of the VM"
}

variable "admin_username" {
  type        = string
  description = "Admin username of the VM"
}

variable "disable_password_auth" {
  type        = bool
  description = "Disable password authentication"
}

variable "public_key" {
  type        = string
  description = "Public key path"
}

variable "peering1_name" {
  type        = string
  description = "Name of the peering 1"
}

variable "peering2_name" {
  type        = string
  description = "Name of the peering 2"
}
