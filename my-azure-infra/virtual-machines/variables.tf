variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}

variable "linux-vm_location" {
  type        = string
  description = "Location of the linux-vm"
}

variable "linux-vm_resource_group" {
  type        = string
  description = "RG name of the linux-vm"
}

variable "linux-vm_vnet_name" {
  type        = string
  description = "Name of the linux-vm VNET"
}

variable "linux-vm_subnet_name" {
  type        = string
  description = "Name of the linux-vm subnet"
}

variable "linux-vm_address_space" {
  type        = list(string)
  description = "Address space of the linux-vm VNET"
}

variable "linux-vm_address_prefixes" {
  type        = list(string)
  description = "Address prefixes of the linux-vm subnet"
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

variable "ansible_pk" {
  type        = string
  description = "Private key for Ansible"
}

variable "ansible_python" {
  type        = string
  description = "Python interpreter for Ansible"
}