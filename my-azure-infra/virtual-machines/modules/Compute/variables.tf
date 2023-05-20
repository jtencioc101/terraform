variable "linux-vm_location" {
  type        = string
  description = "Location of the linux-vm"
}

variable "linux-vm_resource_group" {
  type        = string
  description = "RG name of the linux-vm"
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

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}