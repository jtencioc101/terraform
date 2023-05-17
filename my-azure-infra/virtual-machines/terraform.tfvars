# linux-vm variables
linux-vm_location         = "East US"
linux-vm_resource_group   = "linux-vm_rg"
linux-vm_vnet_name        = "linux-vm_vnet"
linux-vm_subnet_name      = "linux-vm_subnet"
linux-vm_address_space    = ["172.18.0.0/16"]
linux-vm_address_prefixes = ["172.18.0.0/24"]
public_ip_name            = "linux-vm_public_ip"
ip_allocation_method      = "Dynamic"
nic_name                  = "linux-vm_nic"
ipconfig_name             = "linux-vm_ipconfig"
private_ip_allocation     = "Dynamic"

# NSG variables
nsg_name = "linux-vm_nsg"
# NSG rules variables
nsg_rule_name                       = "linux-vm_nsg_rule"
nsg_rule_priority                   = 100
nsg_rule_direction                  = "Inbound"
nsg_rule_access                     = "Allow"
nsg_rule_protocol                   = "*"
nsg_rule_source_port_range          = "*"
nsg_rule_destination_port_range     = "*"
nsg_rule_source_address_prefix      = "186.15.107.177"
nsg_rule_destination_address_prefix = "*"

# Storage account variables
sa_account_tier             = "Standard"
sa_account_replication_type = "LRS"

# Virtual machine variables
vm_name                 = "linux-vm"
vm_size                 = "Standard_B1s"
os_disk_name            = "linux-vm_os_disk"
os_disk_caching         = "ReadWrite"
os_storage_account_type = "Standard_LRS"
publisher               = "Canonical"
offer                   = "UbuntuServer"
sku                     = "18.04-LTS"
os_version              = "latest"
computer_name           = "linux-vm"
admin_username          = "azureadmin"
disable_password_auth   = true

tags = {
  environment = "Production"
  owner       = "Julio"
  project     = "Compute Resources"
}

# Ansible variables
ansible_pk     = "~/.ssh/id_rsa"
ansible_python = "/usr/bin/python3"