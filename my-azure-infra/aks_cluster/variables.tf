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