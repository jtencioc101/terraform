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

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}